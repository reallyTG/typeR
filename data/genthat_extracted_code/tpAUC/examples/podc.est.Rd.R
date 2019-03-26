library(tpAUC)


### Name: podc.est
### Title: Partial ODC Estimation
### Aliases: podc.est

### ** Examples


library('pROC')
data(aSAH)
podc.est(aSAH$outcome, aSAH$s100b, method='expect',threshold=0.8 )




