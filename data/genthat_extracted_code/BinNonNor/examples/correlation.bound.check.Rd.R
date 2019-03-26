library(BinNonNor)


### Name: correlation.bound.check
### Title: Checks if the pairwise correlation among variables are within
###   the feasible range
### Aliases: correlation.bound.check

### ** Examples

prop.vec=c(0.4,0.7)
n.BB=2
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

correlation.bound.check(n.BB,n.NN,prop.vec,corr.vec=NULL,corr.mat,coef.mat)

cor.mat.BB=corr.mat[1:2,1:2]
correlation.bound.check(n.BB,n.NN=0,prop.vec,corr.vec=NULL,corr.mat=cor.mat.BB,
coef.mat=NULL)

cor.mat.NN=corr.mat[3:6,3:6]
correlation.bound.check(n.BB=0,n.NN,prop.vec=NULL,corr.vec=NULL,corr.mat=cor.mat.NN,
coef.mat)

n.BB=1
prop.vec=0.5
corr.mat=diag(n.BB)
correlation.bound.check(n.BB,n.NN=0,prop.vec,corr.vec=NULL,corr.mat=corr.mat,
coef.mat=NULL)

## Not run: 
##D cor.mat.NNnew=cor.mat.NN
##D cor.mat.NNnew[1,2]=0.92
##D cor.mat.NNnew[2,1]=0.92
##D correlation.bound.check(n.BB=0,n.NN,prop.vec=NULL,corr.vec=NULL,corr.mat=cor.mat.NNnew,
##D coef.mat)
## End(Not run)



