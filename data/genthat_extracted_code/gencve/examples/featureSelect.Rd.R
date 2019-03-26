library(gencve)


### Name: featureSelect
### Title: Feature Select For Wide Data
### Aliases: featureSelect
### Keywords: models regression classif

### ** Examples

Xy <- churnTrain
y <- Xy[, ncol(Xy)]
Xy <- Xy[, -ncol(Xy)]
X <- as.matrix.data.frame(Xy[,-(1:5)])
(ind <- featureSelect(X, y, numFeatures=5))
colnames(X)[ind]



