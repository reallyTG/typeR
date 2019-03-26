library(biglasso)


### Name: cv.biglasso
### Title: Cross-validation for biglasso
### Aliases: cv.biglasso

### ** Examples


## cv.biglasso
data(colon)
X <- colon$X
y <- colon$y
X.bm <- as.big.matrix(X)

## logistic regression
cvfit <- cv.biglasso(X.bm, y, family = 'binomial', seed = 1234, ncores = 2)
par(mfrow = c(2, 2))
plot(cvfit, type = 'all')
summary(cvfit)





