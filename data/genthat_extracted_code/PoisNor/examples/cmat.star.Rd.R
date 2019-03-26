library(PoisNor)


### Name: cmat.star
### Title: Computes the correlation of intermediate multivariate normal
###   data before subsequent inverse CDF transformation.
### Aliases: cmat.star

### ** Examples

## Not run: 
##D lamvec= c(0.5,0.7,0.9)
##D M=c(0.352, 0.265, 0.342, 0.09, 0.141, 0.121, 0.297, 
##D   -0.022, 0.177, 0.294, -0.044, 0.129, 0.1, 0.354, 0.386)
##D 
##D N=diag(6)
##D N[lower.tri(N)]=M
##D TV=N+t(N)
##D diag(TV)<-1
##D 
##D cstar = cmat.star(no.pois=3, no.norm=3, TV, lamvec)
## End(Not run)



