library(rioja)


### Name: IKFA
### Title: Imbrie & Kipp Factor Analysis
### Aliases: IKFA IKFA.fit predict.IKFA crossval.IKFA performance.IKFA
###   print.IKFA summary.IKFA plot.IKFA coef.IKFA fitted.IKFA
###   residuals.IKFA screeplot.IKFA rand.t.test.IKFA communality
### Keywords: models multivariate

### ** Examples

data(IK)
spec <- IK$spec
SumSST <- IK$env$SumSST
core <- IK$core

fit <- IKFA(spec, SumSST)
fit
# cross-validate model
fit.cv <- crossval(fit, cv.method="lgo")
# How many components to use?
screeplot(fit.cv)

#predict the core
pred <- predict(fit, core, npls=2)

#plot predictions - depths are in rownames
depth <- as.numeric(rownames(core))
plot(depth, pred$fit[, 2], type="b")

# fit using only factors 1, 2, 4, & 5
# and using polynomial terms
# as Imbrie & Kipp (1971)
fit2 <- IKFA(spec, SumSST, ccoef=c(1, 2, 4, 5), IsPoly=TRUE)
fit2.cv <- crossval(fit2, cv.method="lgo")
screeplot(fit2.cv)

## Not run: 
##D # predictions with sample specific errors
##D # takes approximately 1 minute to run
##D pred <- predict(fit, core, sse=TRUE, nboot=1000)
##D pred
## End(Not run)



