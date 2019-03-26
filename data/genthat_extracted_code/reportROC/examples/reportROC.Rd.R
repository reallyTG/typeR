library(reportROC)


### Name: reportROC
### Title: An Easy Way to Report ROC Analysis
### Aliases: reportROC
### Keywords: ROC analysis

### ** Examples

data(aSAH)
reportROC(gold=aSAH$outcome,predictor=aSAH$s100b,important="se",plot=TRUE)

binary=rep(0,nrow(aSAH))
binary[aSAH$s100b>=0.205]=1
reportROC(gold=aSAH$outcome,predictor.binary=binary)



