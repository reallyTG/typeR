library(PoisBinOrd)


### Name: correlation.bound.check
### Title: Checks if the pairwise correlation among variables are within
###   the feasible range
### Aliases: correlation.bound.check

### ** Examples

## Not run: 
##D n.P<-1
##D n.B<-1
##D n.O<-1
##D lambda.vec<-c(1)
##D prop.vec<-c(0.3)
##D prop.list<-list(c(0.3,0.6))
##D corr.mat=matrix(c(1,0.2,0.1,0.2,1,0.5,0.1,0.5,1),3,3)
##D correlation.bound.check(n.P,n.B,n.O,lambda.vec,prop.vec,prop.list,corr.vec=NULL,
##D corr.mat)
##D 
##D n.P<-2
##D n.B<-2
##D n.O<-2
##D lambda.vec<-c(1,2)
##D prop.vec<-c(0.3,0.5)
##D prop.list<-list(c(0.3,0.6),c(0.5,0.6))
##D corr.mat=matrix(0.8,6,6)
##D diag(corr.mat)=1
##D correlation.bound.check(n.P,n.B,n.O,lambda.vec,prop.vec,prop.list,corr.vec=NULL,
##D corr.mat)
## End(Not run)



