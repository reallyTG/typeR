library(regnet)


### Name: cv.regnet
### Title: k-folds cross-validation for regnet
### Aliases: cv.regnet
### Keywords: models

### ** Examples

## Binary response
data(LogisticExample)
X = rgn.logi$X
Y = rgn.logi$Y
out = cv.regnet(X, Y, response="binary", penalty="network", folds=5, r = 4.5)
out$lambda
b = regnet(X, Y, "binary", "network", out$lambda[1,1], out$lambda[1,2], r = 4.5)
index = which(rgn.logi$beta != 0)
pos = which(b != 0)
tp = length(intersect(index, pos))
fp = length(pos) - tp
list(tp=tp, fp=fp)




