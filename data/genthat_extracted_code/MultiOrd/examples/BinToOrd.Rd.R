library(MultiOrd)


### Name: BinToOrd
### Title: Converts multivariate binary data to multivariate ordinal data
### Aliases: BinToOrd

### ** Examples

## Not run: 	nObs = 1000; nSim = 100000 
## Not run: 
##D 	ordPmat1 = matrix( c(0.15,0.70,0.40,
##D 					0.55,0.10,0.25,
##D 					0.25,0.10,0.15,
##D 					0.05,0.10,0.20),4,3,byrow=TRUE) 
## End(Not run)
					
## Not run: 
##D \	cmat1= matrix( 	c(1,0.2,0.2,
##D 				0.2,1,0.2,
##D 				0.2,0.2,1),3,3,byrow=TRUE) 
## End(Not run)
				
## Not run: 	binObj = simBinCorr(ordPmat1, cmat1, nSim) 
## Not run: 	ep0 = generate.binary( nObs, binObj$pvec, binObj$del.next) 
## Not run: 	Mydata= BinToOrd(binObj$pvec, ordPmat1, binObj$Mlocation, ep0) 	



