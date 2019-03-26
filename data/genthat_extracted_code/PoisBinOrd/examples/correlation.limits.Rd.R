library(PoisBinOrd)


### Name: correlation.limits
### Title: Computes lower and upper correlation bounds for each pair of
###   variables
### Aliases: correlation.limits

### ** Examples

## Not run: 
##D n.P<-3
##D n.B<-2
##D n.O<-3
##D lambda.vec<-c(1,2,3)
##D prop.vec<-c(0.3,0.5)
##D prop.list<-list(c(0.3,0.6),c(0.25,0.5,0.75),c(0.1,0.2,0.8,0.9))
##D 
##D #Correlation limits among Poisson variables
##D correlation.limits(n.P,n.B=0,n.O=0,lambda.vec,prop.vec=NULL,prop.list=NULL)
##D 
##D #See also Cor.PP.Limit in R package PoisNor 
##D 
##D #Correlation limits among binary variables
##D correlation.limits(n.P=0,n.B,n.O=0,lambda.vec=NULL,prop.vec,prop.list=NULL)
##D 
##D #See also correlation.limits in R package BinNonNor 
##D 
##D #Correlation limits among ordinal variables
##D correlation.limits(n.P=0,n.B=0,n.O,lambda.vec=NULL,prop.vec=NULL,prop.list)
##D 
##D #See also Limit_forOO in R package OrdNor 
##D 
##D #Correlation limits among Poisson and binary variables and within themselves.
##D correlation.limits(n.P,n.B,n.O=0,lambda.vec,prop.vec,prop.list=NULL)
##D 
##D #Correlation limits among Poisson and ordinal variables and within themselves.
##D correlation.limits(n.P,n.B=0,n.O,lambda.vec,prop.vec=NULL,prop.list)
##D 
##D #Correlation limits among binary and ordinal variables and within themselves.
##D correlation.limits(n.P=0,n.B,n.O,lambda.vec=NULL,prop.vec,prop.list)
##D 
##D #Correlation limits among Poisson, binary, and ordinal variables and within themselves.
##D correlation.limits(n.P,n.B,n.O,lambda.vec,prop.vec,prop.list)
##D 
##D n.P<-2
##D lambda.vec=c(-1,1)
##D correlation.limits(n.P,n.B=0,n.O=0,lambda.vec,prop.vec=NULL,prop.list=NULL)
## End(Not run)



