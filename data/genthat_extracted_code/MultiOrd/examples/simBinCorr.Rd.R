library(MultiOrd)


### Name: simBinCorr
### Title: Calculates intermediate binary correlation matrix
### Aliases: simBinCorr

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
## Not run: simBinCorr(ordPmat1, cmat1, nSim=100000, steps = 0.025)
				



