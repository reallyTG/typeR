library(PoisBinNonNor)


### Name: correlation.limits
### Title: Computes lower and upper correlation bounds for each pair of
###   variables
### Aliases: correlation.limits

### ** Examples

## Not run: 
##D n.P<-3
##D n.B<-2
##D n.C<-3
##D lambda.vec<-c(1,2,3)
##D prop.vec<-c(0.3,0.5)
##D coef.mat<-matrix(c(
##D -0.3137491,  0.0000000,  0.1004464, 
##D  0.8263239,  1.0857433,  1.1050196,  
##D  0.3137491,  0.0000000, -0.1004464,
##D  0.0227066, -0.0294495, -0.0400078),4,3,byrow=F)  
##D 
##D #Correlation limits among Poisson variables
##D correlation.limits(n.P,n.B=0,n.C=0,lambda.vec,prop.vec=NULL,coef.mat=NULL)
##D 
##D #See also Cor.PP.Limit in R package PoisNor 
##D 
##D #Correlation limits among binary variables
##D correlation.limits(n.P=0,n.B,n.C=0,lambda.vec=NULL,prop.vec,coef.mat=NULL)
##D 
##D #See also correlation.limits in R package BinNonNor 
##D 
##D #Correlation limits among continuous variables
##D correlation.limits(n.P=0,n.B=0,n.C,lambda.vec=NULL,prop.vec=NULL,coef.mat)
##D 
##D #Correlation limits among Poisson and binary variables and within themselves.
##D correlation.limits(n.P,n.B,n.C=0,lambda.vec,prop.vec,coef.mat=NULL)
##D 
##D #Correlation limits among Poisson and continuous variables and within themselves.
##D correlation.limits(n.P,n.B=0,n.C,lambda.vec,prop.vec=NULL,coef.mat)
##D 
##D #Correlation limits among binary and continuous variables and within themselves.
##D correlation.limits(n.P=0,n.B,n.C,lambda.vec=NULL,prop.vec,coef.mat)
##D 
##D #Correlation limits among Poisson, binary, and continuous variables and within themselves.
##D correlation.limits(n.P,n.B,n.C,lambda.vec,prop.vec,coef.mat)
##D 
##D n.P<-2
##D lambda.vec=c(-1,1)
##D correlation.limits(n.P,n.B=0,n.C=0,lambda.vec,prop.vec=NULL,coef.mat=NULL)
##D 
## End(Not run)



