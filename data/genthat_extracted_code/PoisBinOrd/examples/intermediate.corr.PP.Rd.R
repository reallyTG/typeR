library(PoisBinOrd)


### Name: intermediate.corr.PP
### Title: Computes an intermediate normal correlation matrix for Poisson
###   variables given the specified correlation matrix
### Aliases: intermediate.corr.PP

### ** Examples

n.P<-3
lambda.vec<-c(1,2,3)
corr.mat<-matrix(c(1,0.352,0.265,0.352,1,0.121,0.265,0.121,1),n.P,n.P)
intmatPP=intermediate.corr.PP(n.P,lambda.vec,corr.vec=NULL,corr.mat)

## Not run: 
##D #See also cmat.star in  R package PoisNor 
##D #cmat.star(no.pois=3,no.norm=0,corMat=corr.mat,lamvec=lambda.vec)
## End(Not run)



