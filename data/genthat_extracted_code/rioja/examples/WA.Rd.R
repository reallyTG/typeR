library(rioja)


### Name: WA
### Title: Weighted averaging (WA) regression and calibration
### Aliases: WA WA.fit predict.WA crossval.WA performance.WA print.WA
###   summary.WA plot.WA coef.WA fitted.WA residuals.WA rand.t.test.WA
### Keywords: models multivariate

### ** Examples

# pH reconstruction of core K05 from the Round Loch of Glenhead,
# Galloway, SW Scotland. This lake has become acidified over the 
# last c. 150 years

data(SWAP)
data(RLGH)
spec <- SWAP$spec
pH <- SWAP$pH
core <- RLGH$spec
age <- RLGH$depths$Age

fit <- WA(spec, pH, tolDW=TRUE)
# plot predicted vs. observed
plot(fit)
plot(fit, resid=TRUE)

# RLGH reconstruction
pred <- predict(fit, core)

#plot the reconstructio
plot(age, pred$fit[, 1], type="b")

# cross-validation model using bootstrapping
## Not run: 
##D fit.xv <- crossval(fit, cv.method="boot", nboot=1000)
##D par(mfrow=c(1,2))
##D plot(fit)
##D plot(fit, resid=TRUE)
##D plot(fit.xv, xval=TRUE)
##D plot(fit.xv, xval=TRUE, resid=TRUE)
##D 
##D # RLGH reconstruction with sample specific errors
##D pred <- predict(fit, core, sse=TRUE, nboot=1000)
## End(Not run)



