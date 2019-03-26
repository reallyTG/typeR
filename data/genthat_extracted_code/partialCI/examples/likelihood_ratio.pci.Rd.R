library(partialCI)


### Name: likelihood_ratio.pci
### Title: Computes the likelihood ratio of the partially cointegrated
###   model vs the null model
### Aliases: likelihood_ratio.pci
### Keywords: ts models

### ** Examples

YX <- rpci(n=1000, beta=c(2,3,4), sigma_C=c(1,1,1), rho=0.9, sigma_M=0.1, sigma_R=0.2)
likelihood_ratio.pci(YX[,1], YX[,2:ncol(YX)])



