library(gcdnet)


### Name: predict.cv.gcdnet
### Title: make predictions from a "cv.gcdnet" object.
### Aliases: predict.cv.gcdnet
### Keywords: models regression

### ** Examples

data(FHT)
set.seed(2011)
cv=cv.gcdnet(FHT$x, FHT$y,
lambda2 = 1, pred.loss="misclass", 
lambda.factor=0.05,nfolds=5)
pre = predict(cv$gcdnet.fit, newx = FHT$x, 
s = cv$lambda.1se, type = "class")



