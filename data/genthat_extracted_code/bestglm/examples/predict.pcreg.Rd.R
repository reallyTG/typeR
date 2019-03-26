library(bestglm)


### Name: predict.pcreg
### Title: Predict Method for Pcreg.
### Aliases: predict.pcreg
### Keywords: models regression

### ** Examples

XyList <- trainTestPartition(mcdonald)
XyTr <- XyList$XyTr
XyTe <- XyList$XyTe
ans <- pcreg(XyTr, scale=TRUE)
predict(ans, newdata=XyTe)



