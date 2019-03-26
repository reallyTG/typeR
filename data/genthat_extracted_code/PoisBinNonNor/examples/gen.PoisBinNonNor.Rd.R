library(PoisBinNonNor)


### Name: gen.PoisBinNonNor
### Title: Simulates a sample of size n from a set of multivariate Poisson,
###   binary, and continuous data
### Aliases: gen.PoisBinNonNor

### ** Examples

## Not run: 
##D n=100000
##D n.P<-2
##D n.B<-2
##D n.C<-2
##D lambda.vec<-c(2,3)
##D prop.vec<-c(0.3,0.5)
##D mean.vec<-c(0,0)
##D variance.vec<-c(1,1)
##D coef.mat=matrix(rep(c(0,1,0,0), each=2),4,2,byrow=T)
##D corr.mat=matrix(0.4,6,6)
##D diag(corr.mat)=1
##D final.corr.mat=overall.corr.mat(n.P,n.B,n.C,lambda.vec,prop.vec, 
##D coef.mat,corr.vec=NULL,corr.mat)
##D 
##D mymixdata=gen.PoisBinNonNor(n,n.P,n.B,n.C,lambda.vec,prop.vec, 
##D mean.vec,variance.vec,coef.mat,final.corr.mat)
##D 
##D #Check marginals
##D #apply(mymixdata,2,mean)
##D #cor(mymixdata)
##D 
##D n=100000
##D n.P<-2
##D n.B<-2
##D n.N<-2
##D lambda.vec<-c(2,3)
##D prop.vec<-c(0.3,0.5)
##D mean.vec=c(1,0.5)
##D variance.vec=c(1,0.02777778)
##D skewness.vec=c(2,0)
##D kurtosis.vec=c(6,-0.5455)
##D coef.mat=fleishman.coef(2,skewness.vec, kurtosis.vec)
##D corr.mat=matrix(0.3,6,6)
##D diag(corr.mat)=1
##D final.corr.mat=overall.corr.mat(n.P,n.B,n.N,lambda.vec,prop.vec,
##D coef.mat,corr.vec=NULL,corr.mat)
##D mymixdata=gen.PoisBinNonNor(n,n.P,n.B,n.N,lambda.vec,prop.vec,
##D mean.vec, variance.vec,coef.mat,final.corr.mat)
##D 
##D #Check marginals
##D #apply(mymixdata,2,mean)[4:5] 
##D #apply(mymixdata,2,var)[4:5]  
##D #cor(mymixdata)
## End(Not run)



