library(tpAUC)


### Name: proc
### Title: Partial AUC Estimation and Inference
### Aliases: proc

### ** Examples


library('pROC')
data(aSAH)
proc(aSAH$outcome, aSAH$s100b,threshold=0.9, method='expect',ci=TRUE, cp=0.95)




