library(PoisBinNonNor)


### Name: intermediate.corr.CC
### Title: Computes an intermediate correlation matrix for continuous
###   variables given the specified correlation matrix
### Aliases: intermediate.corr.CC

### ** Examples

## Not run: 
##D n.P=2
##D n.C=4
##D coef.mat=matrix(c(
##D  -0.31375,  0.00000,  0.10045, -0.10448,
##D   0.82632,  1.08574,  1.10502,  0.98085,
##D   0.31375,  0.00000, -0.10045,  0.10448,
##D   0.02271, -0.02945, -0.04001,  0.00272),4,byrow=TRUE)
##D corr.vec = NULL
##D corr.mat=matrix(c(1.0,-0.3,-0.3,-0.3,-0.3,-0.3,
##D -0.3,1.0,-0.3,-0.3,-0.3,-0.3,
##D -0.3,-0.3,1.0,0.4,0.5,0.6,
##D -0.3,-0.3,0.4,1.0,0.7,0.8,
##D -0.3,-0.3,0.5,0.7,1.0,0.9,
##D -0.3,-0.3,0.6,0.8,0.9,1.0),6,byrow=TRUE)
##D 
##D intmatCC=intermediate.corr.CC(n.P,n.B=0,n.C,coef.mat,corr.vec=NULL,corr.mat)
##D intmatCC
## End(Not run)



