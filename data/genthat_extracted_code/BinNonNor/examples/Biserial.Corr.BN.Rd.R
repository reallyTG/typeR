library(BinNonNor)


### Name: Biserial.Corr.BN
### Title: Computes biserial correlation matrix for binary and continuous
###   non-normal variables given the specified correlation matrix
### Aliases: Biserial.Corr.BN

### ** Examples

n.BB=2
n.NN=4
prop.vec=c(0.4,0.7)
corr.vec=NULL
corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
-0.3,1.0,-0.3,-0.3,-0.3,-0.3,
-0.3,-0.3,1.0,0.4,0.5,0.6,
-0.3,-0.3,0.4,1.0,0.7,0.8,
-0.3,-0.3,0.5,0.7,1.0,0.9,
-0.3,-0.3,0.6,0.8,0.9,1.0),6,byrow=TRUE)

coef.mat=matrix(c(
 -0.31375,  0.00000,  0.10045, -0.10448,
  0.82632,  1.08574,  1.10502,  0.98085,
  0.31375,  0.00000, -0.10045,  0.10448,
  0.02271, -0.02945, -0.04001,  0.00272),4,byrow=TRUE)

bicor.mat=Biserial.Corr.BN(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)

n.BB=1
n.NN=1
prop.vec=0.6
corr.vec=NULL
corr.mat=matrix(c(1,-0.3,-0.3,1),2,2)
coef.mat=matrix(c(-0.31375,0.82632,0.31375,0.02271),4,1)
bicor.mat=Biserial.Corr.BN(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)



