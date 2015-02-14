
clc
close all
clear all

motion=[1 0 1]

tracks=[0 1 1]

[x1 x2]=size(motion)



feature_mat=[]
for i=1:x2
   mi=motion(i);
 
   ti=tracks(i)
   fea=[];
    clusterfname = sprintf('cluster_motion=%d_tracks=%d.mat',mi,ti)   
    load(clusterfname);

 

clusterfname = sprintf('cluster_motion=%d_tracks=%d',mi,ti);
mkdir(clusterfname);








[lo po]=size(unique(idx))
offset=30600;
path='../../sc/12/';
for i=1:lo
    i
   p=find(idx==i);
   [l1 l2]=size(p);
    cll = sprintf('%s/%d',clusterfname,i)   

   mkdir(cll);
   for j=1:l1
       
       id=p(j);
       s1=index(id,1);
       s2=index(id,2);
  
       vidname=sprintf('%s/%d/%d_%d.avi',clusterfname,i,s1,s2)
	
       outputVideo = VideoWriter(vidname);
outputVideo.FrameRate = 30;
open(outputVideo);

       for k=s1:s2
           img_name = sprintf('%s%d.jpg',path,offset+k);
           im=imread(img_name);
          %  figure,imshow(im);
           writeVideo(outputVideo,im);

       end
        close(outputVideo);

       
   end
    
end
end

