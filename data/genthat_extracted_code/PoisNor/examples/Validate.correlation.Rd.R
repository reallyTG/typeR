library(PoisNor)


### Name: Validate.correlation
### Title: Checks the target correlation matrix.
### Aliases: Validate.correlation

### ** Examples

## Not run: 
##D # An example with a valid target correlation matrix.
##D 
##D lamvec= c(0.05,0.07,0.09)
##D M=c(0.352, 0.265, 0.342, 0.09, 0.141, 0.121, 0.297, 
##D 	-0.022, 0.177, 0.294, -0.044, 0.129, 0.1, 0.354, 0.386)
##D 
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV=N+t(N)
##D diag(TV)<-1
##D 
##D Validate.correlation(no.pois=3, no.norm=3, corMat=TV, lamvec)
##D 
##D 
##D # An example with an invalid target correlation matrix (bound violation).
##D 
##D lamvec= c(0.05,0.07,0.09)
##D M=c(-0.151, -0.085, -0.11, 0.29, 0.6, 0.132, 0.161, 0.139, 
##D 	-0.088, 0.075, -0.025, -0.293, -0.67, -0.03, 0.61)
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV1=N+t(N)
##D diag(TV1)<-1
##D Validate.correlation(no.pois=3, no.norm=3, corMat=TV1, lamvec)
##D 
##D # Examples with an incorrect dimension specification.
##D 
##D lamvec= c(0.05,0.07,0.09)
##D Validate.correlation(no.pois=3, no.norm=2, corMat=TV, lamvec)
##D Validate.correlation(no.pois=2, no.norm=3, corMat=TV, lamvec)
##D 
##D # An example with a non-positive definite correlation matrix.
##D 
##D TV1=TV
##D TV1[5,1]=TV1[1,5] = 1.5
##D Validate.correlation(no.pois=3, no.norm=3, corMat=TV1, lamvec)
##D 
##D # An example with a non-symmetric correlation matrix.
##D 
##D TV1=TV
##D TV1[5,1] = 0.1
##D Validate.correlation(no.pois=3, no.norm=3, corMat=TV1, lamvec)
##D 
##D # An example with an invalid diagonal element in the correlation matrix.
##D 
##D TV1=TV
##D TV1[5,5] = 2
##D Validate.correlation(no.pois=3, no.norm=3, corMat=TV1, lamvec)
## End(Not run)



