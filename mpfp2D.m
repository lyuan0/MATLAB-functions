%% Function:    mpfp2D
% Description:  use scatteredInterpolant to get displacement field
function D = mpfp2D(mp,fp,sz,methods)
% Input:    mp/fp, n*2
%           sz, vector, output image size
% Output:   D, double, displacement field of x & y
%           i.e. tfImage =  imwarp(im,iD)
%           methods, str, methods for scatteredInterpolant

% Point difference
pDiff = fp-mp;

% Coordinates of the whole matrix
[xq,yq] = meshgrid(1:sz(2),1:sz(1));

D = zeros([sz,2]);
for i = 1:2 % (can use parfor here)
    F = scatteredInterpolant(mp,pDiff(:,i),methods);
    vq = F(xq,yq);

    D(:,:,i) = vq;
end
end
