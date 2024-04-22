%%=================================%%
%%=====解析法重建平行束投影========%%
clc;
clear all;
close all;
%%=====仿真参数设置=====%%
N = 256; %  重建图像大小，探测器通道个数
theta = 0:1:179; % 投影角度

%%=====产生Shepp-Logan仿真数据=====%%
I = phantom(N);
% 设定探测器通道个数
N_d = 2 * ceil(norm(size(I)-floor((size(I)-1)/2)-1))+3;
% 产生投影数据
P = medfuncParallelBeamForwardProjection(theta, N, N_d);
P_radon = radon(I, theta);

%%=====仿真结果显示=====%%
figure;
imshow(I, []), title("256*256头模型图像");
figure;
imagesc(P), colormap("gray"), colorbar, title("解析法 180°平行束投影")
figure;
imagesc(P_radon), colormap("gray"), colorbar, title("radon 180°平行束投影")