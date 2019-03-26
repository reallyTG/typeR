library(PEIP)


### Name: gcval
### Title: Get c-val
### Aliases: gcval
### Keywords: misc

### ** Examples


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

lam=sqrt(diag(t(Lam1 %*% Lam1)));

mu=sqrt(diag(t(M1)%*%M1));

p=rnk(L1);

sm1=cbind(lam[1:p],mu[1:p])

### % get the gcv values varying alpha

###
ngcvpoints=1000;

HI = gcval(U1,sm1,t,ngcvpoints);






