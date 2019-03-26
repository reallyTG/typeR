library(PoisBinNonNor)


### Name: intermediate.corr.PB
### Title: Computes the pairwise entries of the intermediate normal
###   correlation matrix for all Poisson-binary combinations given the
###   specified correlation matrix.
### Aliases: intermediate.corr.PB

### ** Examples

## Not run: 
##D n.P<-2
##D n.B<-1
##D lambda.vec<-c(2,3)
##D prop.vec<-c(0.3)
##D corr.mat=matrix(c(1,0.2,0.1,0.2,1,0.5,0.1,0.5,1),3,3)
##D 
##D intmatPB=intermediate.corr.PB(n.P,n.B,n.C=0,lambda.vec,prop.vec,coef.mat=NULL, 
##D corr.vec=NULL,corr.mat)
##D intmatPB
## End(Not run)



