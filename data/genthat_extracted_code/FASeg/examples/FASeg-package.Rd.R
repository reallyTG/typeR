library(FASeg)


### Name: FASeg-package
### Title: Joint Segmentation of Set of Correlated Time-Series
### Aliases: FASeg-package FASeg
### Keywords: Dynamic programming; EM algorithm; Factor model;
###   Segmentation; Model selection; Multivariate time-series

### ** Examples

library(FASeg)
data(Y)
M=max(Y$series)
uniKmax=3
multiKmax=11
qmax=M-1
selection=FALSE
WithoutCorr=FALSE
seg=F_FASeg(Y,uniKmax,multiKmax,qmax,selection,WithoutCorr)



