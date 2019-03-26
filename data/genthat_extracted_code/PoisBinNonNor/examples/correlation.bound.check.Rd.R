library(PoisBinNonNor)


### Name: correlation.bound.check
### Title: Checks if the pairwise correlation among variables are within
###   the feasible range
### Aliases: correlation.bound.check

### ** Examples

## Not run: 
##D n.P<-1
##D n.B<-1
##D n.C<-1
##D lambda.vec<-c(1)
##D prop.vec<-c(0.3)
##D coef.mat<-matrix(c(-0.3137491,0.8263239,0.3137491,0.0227066),4,1,byrow=F) 
##D corr.mat=matrix(c(1,0.2,0.1,0.2,1,0.5,0.1,0.5,1),3,3)
##D correlation.bound.check(n.P,n.B,n.C,lambda.vec,prop.vec,coef.mat,corr.vec=NULL, 
##D corr.mat)
##D 
##D n.P<-2
##D n.B<-2
##D n.C<-2
##D lambda.vec<-c(1,2)
##D prop.vec<-c(0.3,0.5)
##D coef.mat<-matrix(c(
##D -0.3137491,  0.0000000,   
##D  0.8263239,  1.0857433,    
##D  0.3137491,  0.0000000,
##D  0.0227066, -0.0294495),4,2,byrow=F)  
##D corr.mat=matrix(0.8,6,6)
##D diag(corr.mat)=1
##D correlation.bound.check(n.P,n.B,n.C,lambda.vec,prop.vec,coef.mat,corr.vec=NULL, 
##D corr.mat)
## End(Not run)



