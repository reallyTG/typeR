library(PoisBinOrd)


### Name: intermediate.corr.P_BO
### Title: Computes the pairwise entries of the intermediate normal
###   correlation matrix for all Poisson-binary and Poisson-ordinal
###   variable combinations given the specified correlation matrix.
### Aliases: intermediate.corr.P_BO

### ** Examples

## Not run: 
##D n.P<-1
##D n.B<-1
##D n.O<-1
##D lambda.vec<-c(1)
##D prop.vec<-c(0.3)
##D prop.list<-list(c(0.3,0.6))
##D corr.mat=matrix(c(1,0.2,0.1,0.2,1,0.5,0.1,0.5,1),3,3)
##D 
##D intmatP_BO=intermediate.corr.P_BO(n.P,n.B,n.O,lambda.vec,prop.vec,prop.list, 
##D corr.vec=NULL,corr.mat)
## End(Not run)



