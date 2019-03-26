library(partialCI)


### Name: hedge.pci
### Title: Searches for a partially cointegrated hedge for a given time
###   series
### Aliases: hedge.pci
### Keywords: ts models

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## Not run: 
##D YX <- rpci(n=1000, beta=c(2,3,4,5,6), 
##D   sigma_C=c(0.1,0.1,0.1,0.1,0.1), rho=0.9, sigma_M=1, sigma_R=1)
##D YXC <- cbind(YX, matrix(rnorm(5000), ncol=5))
##D hedge.pci(YX[,1], YX[,2:ncol(YX)])
##D hedge.pci(YXC[,1], YXC[,2:ncol(YXC)])
## End(Not run)




