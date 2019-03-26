library(partialCI)


### Name: fit.pci
### Title: Fits the partial cointegration model to a collection of time
###   series
### Aliases: fit.pci
### Keywords: ts models

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.


YX <- rpci(n=1000, beta=c(2,3,4), sigma_C=c(1,1,1), rho=0.9,sigma_M=0.1, sigma_R=0.2)
fit.pci(YX[,1], YX[,2:ncol(YX)])




