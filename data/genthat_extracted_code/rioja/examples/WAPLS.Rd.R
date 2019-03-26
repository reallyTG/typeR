library(rioja)


### Name: WAPLS
### Title: Weighted averaging partial least squares (WAPLS) regression and
###   calibration
### Aliases: WAPLS WAPLS.fit predict.WAPLS crossval.WAPLS performance.WAPLS
###   print.WAPLS summary.WAPLS plot.WAPLS coef.WAPLS fitted.WAPLS
###   residuals.WAPLS screeplot.WAPLS rand.t.test.WAPLS
### Keywords: models multivariate

### ** Examples

data(IK)
spec <- IK$spec
SumSST <- IK$env$SumSST
core <- IK$core

fit <- WAPLS(spec, SumSST)
fit
# cross-validate model
fit.cv <- crossval(fit, cv.method="loo")
# How many components to use?
rand.t.test(fit.cv)
screeplot(fit.cv)

#predict the core
pred <- predict(fit, core, npls=2)

#plot predictions - depths are in rownames
depth <- as.numeric(rownames(core))
plot(depth, pred$fit[, 2], type="b", ylab="Predicted SumSST", las=1)

# predictions with sample specific errors
## Not run: 
##D pred <- predict(fit, core, npls=2, sse=TRUE, nboot=1000)
##D pred
## End(Not run)



