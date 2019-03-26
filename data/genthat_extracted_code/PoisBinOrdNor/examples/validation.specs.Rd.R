library(PoisBinOrdNor)


### Name: validation.specs
### Title: Validates user-specified parameters
### Aliases: validation.specs validation_specs

### ** Examples

## Not run: 
##D 
##D num_pois<-1
##D num_bin<-1
##D num_ord<-1
##D num_norm<-1
##D lambda<-c(1)
##D pbin<-c(0.3)
##D pord<-list(c(0.3,0.6))
##D normean<-15
##D norvar<-7
##D corr.mat=matrix(c(1,0.2,0.1,0.3, 0.2,1,0.5,0.4, 0.1,0.5,1, 0.7, 0.3, 0.4, 0.7, 1),4,4)
##D validation.specs(num_pois, num_bin, num_ord, num_norm, 
##D corr.mat, pbin, pord, lambda, normean,norvar)
##D 
##D num_pois<-2
##D num_bin<-2
##D num_ord<-2
##D num_norm<-0
##D lambda<-c(1,2)
##D pbin<-c(0.3,0.5)
##D pord<-list(c(0.3,0.6),c(0.5,0.6))
##D corr.mat=matrix(0.64,6,6)
##D diag(corr.mat)=1
##D validation.specs(num_pois, num_bin, num_ord, num_norm, 
##D corr.mat, pbin, pord, lambda, nor.mean=NULL, nor.var=NULL)
##D 
##D 
##D # An example with an invalid target correlation matrix (bound violation).
##D num_pois<-1
##D num_bin<-2
##D num_ord<-2
##D num_norm<-1
##D lamvec=c(1)
##D pbin=c(0.3, 0.7)
##D pord=list(c(0.2, 0.5), c(0.4, 0.7, 0.8))
##D nor.mean=2.1
##D nor.var=0.75
##D M=c(-0.35, 0.26, 0.34, 0.09, 0.14, 0.12, 0.30, -0.02, 0.17, 0.29, -0.04, 0.19, 
##D 0.10, 0.35, 0.39)
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV=N+t(N)
##D diag(TV)<-1
##D validation.specs(num_pois, num_bin, num_ord, num_norm, corr.mat=TV, pbin, pord,
##D lamvec, normean, norvar) 
##D 
##D 
##D # An example with a non-positive definite correlation matrix.
##D pbin=c(0.3, 0.7)
##D TV1=TV
##D TV1[3,2]=TV[2,3]=5
##D validation.specs(num_pois, num_bin, num_ord, num_norm, corr.mat=TV1, pbin, pord,
##D lamvec, normean, norvar) 
## End(Not run)



