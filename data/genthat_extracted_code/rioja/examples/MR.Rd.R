library(rioja)


### Name: MR
### Title: Multiple regression
### Aliases: MR MR.fit predict.MR crossval.MR performance.MR print.MR
###   summary.MR plot.MR coef.MR fitted.MR residuals.MR
### Keywords: models multivariate

### ** Examples

data(IK)
spec <- IK$spec
SumSST <- IK$env$SumSST
core <- IK$core

# Generate a MR model using taxa with max abun > 20%

mx <- apply(spec, 2, max)
spec2 <- spec[, mx > 20]

fit <- MR(spec2, SumSST)
fit
# cross-validate model
fit.cv <- crossval(fit, cv.method="lgo")
fit.cv

#predict the core
pred <- predict(fit, core)

#plot predictions - depths are in rownames
depth <- as.numeric(rownames(core))
plot(depth, pred$fit[, 1], type="b")

## Not run: 
##D # predictions with sample specific errors
##D # takes approximately 1 minute to run
##D pred <- predict(fit, core, sse=TRUE, nboot=1000)
##D pred
## End(Not run)



