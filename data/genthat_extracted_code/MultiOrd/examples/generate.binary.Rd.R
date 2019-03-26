library(MultiOrd)


### Name: generate.binary
### Title: Generates multivariate binary data given marginal probabilities
###   and correlation.
### Aliases: generate.binary

### ** Examples

## Not run: 
##D ordPmat1 = matrix( c(0.15,0.70,0.40,
##D 					0.55,0.10,0.25,
##D 					0.25,0.10,0.15,
##D 					0.05,0.10,0.20),4,3,byrow=TRUE)
## End(Not run)
## Not run: 
##D cmat1= matrix( 	c(1,0.2,0.2,
##D 				0.2,1,0.2,
##D 				0.2,0.2,1),3,3,byrow=TRUE)
## End(Not run)
## Not run: p=find.binary.prob(ordPmat1) 
## Not run: finalCorr = simBinCorr(ordPmat1, cmat1, nSim=100000)
## Not run: y=generate.binary( 1000, p$p, finalCorr$del.next)



