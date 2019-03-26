library(biglasso)


### Name: predict.cv.biglasso
### Title: Model predictions based on a fitted 'cv.biglasso' object
### Aliases: predict.cv.biglasso coef.cv.biglasso
### Keywords: models regression

### ** Examples


## predict.cv.biglasso
data(colon)
X <- colon$X
y <- colon$y
X.bm <- as.big.matrix(X)
fit <- biglasso(X.bm, y, penalty = 'lasso', family = "binomial")
cvfit <- cv.biglasso(X.bm, y, penalty = 'lasso', family = "binomial", seed = 1234, ncores = 2)
coef <- coef(cvfit)
coef[which(coef != 0)]
predict(cvfit, X.bm, type = "response")
predict(cvfit, X.bm, type = "link")
predict(cvfit, X.bm, type = "class")




