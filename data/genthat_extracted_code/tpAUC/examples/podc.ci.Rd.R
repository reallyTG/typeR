library(tpAUC)


### Name: podc.ci
### Title: Partial ODC Inference
### Aliases: podc.ci

### ** Examples


library('pROC')
data(aSAH)
podc.ci(aSAH$outcome, aSAH$s100b, method='expect',threshold=0.8, cp=0.97)




