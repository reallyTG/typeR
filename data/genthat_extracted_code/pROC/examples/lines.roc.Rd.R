library(pROC)


### Name: lines.roc
### Title: Add a ROC line to a ROC plot
### Aliases: lines.roc lines.roc.roc lines.smooth.roc lines.roc.smooth.roc
###   lines.roc.default lines.roc.formula
### Keywords: univar nonparametric utilities aplot hplot roc

### ** Examples

data(aSAH)

rocobj <- plot.roc(aSAH$outcome, aSAH$s100b, type="n")
lines(rocobj, type="b", pch=21, col="blue", bg="grey")

# Without using 'lines':
rocobj <- plot.roc(aSAH$outcome, aSAH$s100b, type="b", pch=21, col="blue", bg="grey")




