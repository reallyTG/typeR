library(partialCI)


### Name: statehistory.pci
### Title: Generates the sequence of inferred states of a partial
###   cointegration model
### Aliases: statehistory.pci
### Keywords: ts models

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

YX <- rpci(n=1000, beta=c(2,3), sigma_C=c(0.1,0.1), rho=0.9, sigma_M=1, sigma_R=2)
f <- fit.pci(YX[,1], YX[,2:ncol(YX)])
statehistory.pci(f)




