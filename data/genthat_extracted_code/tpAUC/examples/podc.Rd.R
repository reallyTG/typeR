library(tpAUC)


### Name: podc
### Title: Partial ODC Estimation and Inference
### Aliases: podc

### ** Examples


library('pROC')
data(aSAH)
podc(aSAH$outcome, aSAH$s100b,threshold=0.9, method='expect',ci=TRUE, cp=0.95 )




