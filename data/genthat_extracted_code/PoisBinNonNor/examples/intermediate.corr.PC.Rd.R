library(PoisBinNonNor)


### Name: intermediate.corr.PC
### Title: Computes the pairwise entries of the intermediate normal
###   correlation matrix for all Poisson-continuous combinations given the
###   specified correlation matrix.
### Aliases: intermediate.corr.PC

### ** Examples

## Not run: 
##D n.P=2
##D n.C=4
##D lambda.vec=c(2,3)
##D coef.mat=matrix(rep(c(0,1,0,0),each=4),4,byrow=TRUE)
##D corr.vec = NULL
##D corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
##D -0.3,1.0,-0.3,-0.3,-0.3,-0.3,
##D -0.3,-0.3,1.0,0.4,0.5,0.6,
##D -0.3,-0.3,0.4,1.0,0.7,0.8,
##D -0.3,-0.3,0.5,0.7,1.0,0.9,
##D -0.3,-0.3,0.6,0.8,0.9,1.0),6,byrow=TRUE)
##D 
##D intmatPC=intermediate.corr.PC(n.P,n.B=0,n.C,lambda.vec,prop.vec=NULL, 
##D coef.mat,corr.vec=NULL,corr.mat)
##D 
##D intmatPC
##D 
##D #See also cmat.star in  R package PoisNor 
##D #cmat.star(no.pois=2,no.norm=4,corMat=corr.mat,lamvec=lambda.vec)
## End(Not run)



