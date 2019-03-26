library(BinNonNor)


### Name: correlation.limits
### Title: Computes lower and upper correlation bounds for each pair of
###   variables
### Aliases: correlation.limits

### ** Examples


n.BB=2
n.NN=4
prop.vec=c(0.4,0.7)
coef.mat=matrix(c(
 -0.31375,  0.00000,  0.10045, -0.10448,
  0.82632,  1.08574,  1.10502,  0.98085,
  0.31375,  0.00000, -0.10045,  0.10448,
  0.02271, -0.02945, -0.04001,  0.00272),4,byrow=TRUE)

limits=correlation.limits(n.BB,n.NN,prop.vec,coef.mat)
limits.bin=correlation.limits(n.BB,n.NN=0,prop.vec,coef.mat=NULL)
limits.nonnor=correlation.limits(n.BB=0,n.NN,prop.vec=NULL,coef.mat)

## Not run: 
##D n.BB=1
##D prop.vec=0.5
##D limits=correlation.limits(n.BB,n.NN,prop.vec,coef.mat=NULL)
## End(Not run)



