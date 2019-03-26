library(Kendall)


### Name: Kendall-package
### Title: Kendall correlation and trend tests.
### Aliases: Kendall-package
### Keywords: ts package

### ** Examples

library(boot)
data(PrecipGL)
MKtau<-function(z) MannKendall(z)$tau
tsboot(PrecipGL, MKtau, R=500, l=5, sim="fixed")



