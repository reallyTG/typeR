library(BinNonNor)


### Name: Int.Corr.NN
### Title: Computes an intermediate correlation matrix for continuous
###   non-normal variables given the specified correlation matrix
### Aliases: Int.Corr.NN

### ** Examples

n.NN=4
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

intcor.mat=Int.Corr.NN(n.NN,corr.vec=NULL,corr.mat,coef.mat) 



