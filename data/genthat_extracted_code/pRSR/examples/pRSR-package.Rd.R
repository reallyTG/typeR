library(pRSR)


### Name: pRSR-package
### Title: It tests periodicity for any series using response surface
###   regression (RSR).
### Aliases: pRSR-package pRSR
### Keywords: package

### ** Examples

# #Testing periodicity
z<-SimulateHReg(20, f=2.5/20, 1, 2)
pvalrsr(z)  # finding p-value using RSR

# For comparing with Fisher's g test
# library(GeneCycle)
# fisher.g.test(z) # Fisher's g test

# Plot for 75%, 90% and 95% quantiles.
plotrsr(n=10:50, q=c(75,90,95))



