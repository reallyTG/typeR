library(pCalibrate)


### Name: pCalibrate-package
### Title: Bayesian Calibrations of P-Values
### Aliases: pCalibrate-package
### Keywords: package htest

### ** Examples

pCalibrate(p=c(0.05, 0.01, 0.001), alternative="noninformative")
zCalibrate(p=c(0.05, 0.01, 0.005), type="one.sided", alternative="simple")
zCalibrate(p=c(0.05, 0.01, 0.005),  type="two.sided", alternative="normal")
tCalibrate(p=c(0.05, 0.01, 0.005), n=c(10, 20, 50), type="two.sided", alternative="normal")
FCalibrate(p=c(0.05, 0.01, 0.005), n=20, d=c(2, 5, 10), alternative="chi.squared")
LRCalibrate(p=c(0.05, 0.01, 0.005), df=2, alternative="simple")



