library(tpAUC)


### Name: proc.est
### Title: Partial AUC Estimation
### Aliases: proc.est

### ** Examples


library('pROC')
data(aSAH)
proc.est(aSAH$outcome, aSAH$s100b, method='expect',threshold=0.8)




