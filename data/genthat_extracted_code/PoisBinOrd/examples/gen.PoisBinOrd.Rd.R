library(PoisBinOrd)


### Name: gen.PoisBinOrd
### Title: Simulates a sample of size n from a set of multivariate Poisson,
###   binary, and ordinal variables
### Aliases: gen.PoisBinOrd

### ** Examples

## Not run: 
##D n=100
##D n.P<-2
##D n.B<-2
##D n.O<-2
##D lambda.vec<-sample(10,2)
##D prop.vec<-runif(2)
##D prop.list<-list(c(0.3,0.6,0.7),c(0.2,0.3,0.5))
##D corr.mat=matrix(0.4,6,6)
##D diag(corr.mat)=1
##D final.corr.mat=overall.corr.mat(n.P,n.B,n.O,lambda.vec,prop.vec,
##D prop.list,corr.vec=NULL,corr.mat)
##D mymixdata=gen.PoisBinOrd(n,n.P,n.B,n.O,lambda.vec,prop.vec,prop.list, 
##D final.corr.mat)
## End(Not run)



