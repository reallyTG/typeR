library(partialCI)


### Name: loglik.pci
### Title: Computes the log likelihood of a partially cointegrated model
### Aliases: loglik.pci
### Keywords: ts models

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

    set.seed(1)
    YX <- rpci(n=500, beta=c(2,3,4), sigma_C=c(1,1,1), rho=0.9, sigma_M=0.1, sigma_R=0.2)
    loglik.pci(YX[,1], YX[,2:ncol(YX)], beta=c(2,3,4), rho=0.9, sigma_M=0.1, sigma_R=0.2)




