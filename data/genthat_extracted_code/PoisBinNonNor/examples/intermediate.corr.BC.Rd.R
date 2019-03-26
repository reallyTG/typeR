library(PoisBinNonNor)


### Name: intermediate.corr.BC
### Title: Computes intermediate correlation matrix for binary and
###   continuous variables given the specified correlation matrix
### Aliases: intermediate.corr.BC

### ** Examples

## Not run: 
##D n.B<-2
##D n.C<-4
##D prop.vec=c(0.4,0.7)
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
##D intmatBC=intermediate.corr.BC(n.P=0,n.B,n.C,lambda.vec=NULL,prop.vec,coef.mat, 
##D corr.vec=NULL,corr.mat)
##D intmatBC
##D 
##D n.B<-1
##D n.C<-1
##D prop.vec=0.6
##D coef.mat=matrix(c(-0.31375,0.82632,0.31375,0.02271),4,1)
##D corr.vec=NULL
##D corr.mat=matrix(c(1,-0.3,-0.3,1),2,2)
##D 
##D intmatBC=intermediate.corr.BC(n.P=0,n.B,n.C,lambda.vec=NULL,prop.vec,coef.mat, 
##D corr.vec=NULL,corr.mat)
##D intmatBC
## End(Not run)



