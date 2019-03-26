library(PEIP)


### Name: l_curve_tikh_svd
### Title: L-curve Tikhonov
### Aliases: l_curve_tikh_svd
### Keywords: misc

### ** Examples

####  Vertical Seismic Profile example
set.seed(2015)
VSP = vspprofile()
t = VSP$t2
G = VSP$G
M = VSP$M
N = VSP$N

L1 = get_l_rough(N,1);
littleU = PEIP::GSVD(as.matrix(G), as.matrix(L1) );

BIGU = flipGSVD(littleU, dim(G), dim(L1) )

U1 = BIGU$U
V1 =BIGU$V
X1=BIGU$X
Lam1=BIGU$C
M1=BIGU$S

K1 = l_curve_tikh_svd(U1, diag(M1) , X1, 25, varargin = NULL)

rho1 =K1$rho
eta1 =K1$eta
reg_param1 =K1$reg_param
m1s =K1$m

###  store where the corner is (from visual inspection)
ireg_corner1=8;
rho_corner1=rho1[ireg_corner1];
eta_corner1=eta1[ireg_corner1];
print(paste("1st order reg corner is:  ",ireg_corner1));

plot(rho1,eta1,type="b", log="xy" ,
     xlab="Residual Norm ||Gm-d||_2", ylab="Solution Seminorm ||Lm||_2"  );




