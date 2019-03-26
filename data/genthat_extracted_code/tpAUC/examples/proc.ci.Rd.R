library(tpAUC)


### Name: proc.ci
### Title: Partial AUC Inference
### Aliases: proc.ci

### ** Examples


library('pROC')
data(aSAH)
proc.ci(aSAH$outcome, aSAH$s100b, cp=0.95 ,threshold=0.9,method='expect')




