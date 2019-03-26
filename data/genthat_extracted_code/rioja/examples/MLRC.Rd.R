library(rioja)


### Name: MLRC
### Title: Palaeoenvironmental reconstruction using Maximum Likelihood
###   Response Surfaces
### Aliases: MLRC MLRC.fit predict.MLRC crossval.MLRC performance.MLRC
###   print.MLRC summary.MLRC plot.MLRC coef.MLRC fitted.MLRC
###   residuals.MLRC
### Keywords: models multivariate

### ** Examples

data(IK)
spec <- IK$spec / 100
SumSST <- IK$env$SumSST
core <- IK$core / 100

fit <- MLRC(spec, SumSST)
fit

#predict the core
pred <- predict(fit, core)

#plot predictions - depths are in rownames
depth <- as.numeric(rownames(core))
plot(depth, pred$fit[, 1], type="b")

## Not run: 
##D # this is slow!
##D # cross-validate model
##D fit.cv <- crossval(fit, cv.method="loo", verbose=5)
##D 
##D # predictions with sample specific errors
##D pred <- predict(fit, core, sse=TRUE, nboot=1000, verbose=5)
## End(Not run)



