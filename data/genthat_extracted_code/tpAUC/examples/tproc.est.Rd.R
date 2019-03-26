library(tpAUC)


### Name: tproc.est
### Title: Two-Way Partial AUC Estimation
### Aliases: tproc.est

### ** Examples


library('pROC')
data(aSAH)
tproc.est(aSAH$outcome, aSAH$s100b, threshold=c(0.8,0.2))





