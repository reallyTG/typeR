library(PoisNor)


### Name: genPoisNor
### Title: Generates a data set with Poisson and normal variables.
### Aliases: genPoisNor

### ** Examples

## Not run: 
##D   lamvec= c(0.05,0.07,0.09)
##D   M=c(0.352, 0.265, 0.342, 0.09, 0.141, 0.121, 0.297, 
##D 		-0.022, 0.177, 0.294, -0.044, 0.129, 0.1, 0.354, 0.386)
##D   N=diag(6)
##D   N[lower.tri(N)]=M
##D   TV=N+t(N)
##D   diag(TV)<-1
##D   
##D   cstar = cmat.star(no.pois=3, no.norm=3, TV, lamvec)
##D   mydata=genPoisNor(n=200, no.norm=3,  no.pois=3, cmat.star=cstar,
##D 		 lamvec, sd.vec=c(1,1,1), mean.vec=c(0,0,0))
## End(Not run)



