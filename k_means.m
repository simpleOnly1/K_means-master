clear;clc;close all;

data=imread('3.jpg');
[m,n,c]=size(data);
%输入聚类个数
disp('请输入聚类个数：')
r=input('');
imshow(data)
%通过k_means聚类进行分类（根据通道值的域值进行划分）
[mu,pattern]=k_mean_Seg(data,r);

for x=1:m
    for y=1:n
        %第一类（域值空间小）
        if pattern(x,y,1)==1
            data(x,y,1)=0;
            data(x,y,2)=0;
            data(x,y,3)=255;
        %第二类（域值空间中等）
        elseif pattern(x,y,1)==2
            data(x,y,1)=0;
            data(x,y,2)=255;
            data(x,y,3)=0;
        %第三类    
        elseif pattern(x,y,1)==3
            data(x,y,1)=255;
            data(x,y,2)=0;
            data(x,y,3)=0;
        %第四类 
        elseif pattern(x,y,1)==4
            data(x,y,1)=255;
            data(x,y,2)=255;
            data(x,y,3)=0;
        %第五类     
        elseif pattern(x,y,1)==5 
            data(x,y,1)=0;
            data(x,y,2)=255;
            data(x,y,3)=255; 
        %第六类 
        elseif pattern(x,y,1)==6 
            data(x,y,1)=255;
            data(x,y,2)=0;
            data(x,y,3)=255; 
        %第七类     
        else  
            data(x,y,1)=255;
            data(x,y,2)=255;
            data(x,y,3)=255; 
        end
    end
end

t = data(:);
w = pattern(:);
J=ones(m,n,3);
for i=1:m*n
    if(w(i,1) == r)            
        c = [t(i), t(i+m*n), t(i+2*m*n)];
        break;
    end
end
% 
% % 初始化下标记录矩阵
% d = [0 0];
% for i=1:m*n
%        if ((t(i)==c(1))&&(t(i+m*n)==c(2))&&t(i+2*m*n)==c(3))
%           d = [d ; VerctorToMatrixsIndex(i,data)]; 
%        end
% end
% % 计算下标矩阵的大小，并去除初始化的第一行
% [m1 m2] = size(d);
% d = [d(2:m1,1) d(2:m1,2)];
% 
% J(:,:) = data(d(:,1),d(:,2));

for x=1:m
    for y=1:n
        if ((data(x,y,1)==c(1))&&(data(x,y,2)==c(2))&&data(x,y,3)==c(3))
            J(x,y,:)=data(x,y,:);
        end
    end
end
figure;
imshow(data); 
figure;
imshow(J);

 

  