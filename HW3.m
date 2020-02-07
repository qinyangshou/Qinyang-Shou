close all

%% problem a
% For nyquist sampling, FOVx = 1/△kx, and FOVy = 1/△ky
deltakx = 1/0.7;
deltaky = 1/0.92;
pause

%% problem b
[kx,ky] = meshgrid([-128:127]*deltakx,[-128:127]*deltaky);
s = sheppLoganFourierT(kx,ky);
figure(1)
imshow(log(s),[])
title('log of the ksapce')
xlabel('kx/cm-1'), ylabel('ky/cm-1')
pause

%% problem c
im_shepplogan = ift(s);
figure(2)
subplot(1,2,1)
imshow(abs(im_shepplogan),[]);
title('magnitude of the reconstructed image')
subplot(1,2,2)
imshow(angle(im_shepplogan))
title('phase of the reconstructed image')
pause

%% problem d
% comment problem b
% over-sampling
%-------------------------------------------------------------------------
deltakx = 1/0.7/2;
deltaky = 1/0.92/2;
[kx,ky] = meshgrid([-128:127]*deltakx,[-128:127]*deltaky);
s = sheppLoganFourierT(kx,ky);
figure(3)
subplot(1,2,1)
imshow(log(s),[])
title('log of the ksapce')
xlabel('kx/cm-1'), ylabel('ky/cm-1')
im_shepplogan = ift(s);
subplot(1,2,2)
imshow(abs(im_shepplogan),[]);
title('reconstructed image')
pause

%under-sampling 
%-------------------------------------------------------------------------

deltakx = 2/0.7;
deltaky = 2/0.92;
[kx,ky] = meshgrid([-128:127]*deltakx,[-128:127]*deltaky);
s = sheppLoganFourierT(kx,ky);
figure(4)
subplot(1,2,1)
imshow(log(s),[])
title('log of the ksapce')
xlabel('kx/cm-1'), ylabel('ky/cm-1')
im_shepplogan = ift(s);
subplot(1,2,2)
imshow(abs(im_shepplogan),[]);
title('reconstructed image')
pause

%% problem e
deltakx = 1/0.7;
deltaky = 1/0.92;
[kx,ky] = meshgrid([-128:127]*deltakx,[-128:127]*deltaky);
s = sheppLoganFourierT(kx,ky);

% comment problem d and uncomment problem b
mask1 = zeros(256);
mask1((128-16):(128+15),(128-16):(128+15))=1;
mask2 = ones(256);
mask2((128-16):(128+15),(128-16):(128+15))=0;
% center set to zero
%------------------------------------------------------------------------
s1 = s.*mask2;
im_shepplogan = ift(s1);
figure(5)
subplot(1,2,1)
imshow(log(s1),[])
title('kspace')
subplot(1,2,2)
imshow(abs(im_shepplogan),[]);
title('reconstructed image')
pause
% peripheral set to zeros
%------------------------------------------------------------------------
s2 = s.*mask1;
im_shepplogan = ift(s2);
figure(6)
subplot(1,2,1)
imshow(log(s2),[])
title('kspace')
subplot(1,2,2)
imshow(abs(im_shepplogan),[]);
title('reconstructed image')
pause


