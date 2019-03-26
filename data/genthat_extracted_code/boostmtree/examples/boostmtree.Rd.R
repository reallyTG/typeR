library(boostmtree)


### Name: boostmtree
### Title: Boosted multivariate trees for longitudinal data
### Aliases: boostmtree boostmtree
### Keywords: boosting

### ** Examples

##------------------------------------------------------------
## synthetic example
## 0.8 correlation, quadratic time with quadratic interaction
##-------------------------------------------------------------
#simulate the data (use a small sample size for illustration)
dta <- simLong(n = 50, N = 5, rho =.80, model = 2)$dtaL

#basic boosting call (M set to a small value for illustration)
boost.grow <- boostmtree(dta$features, dta$time, dta$id, dta$y, M = 20)

#print results
print(boost.grow)

#plot.results
plot(boost.grow)

## Not run: 
##D ##------------------------------------------------------------
##D ## same synthetic example as above but with in-sample cross-validation
##D ## estimate for RMSE and vimp
##D ##-------------------------------------------------------------
##D dta <- simLong(n = 50, N = 5, rho =.80, model = 2)$dtaL
##D boost.cv.grow <- boostmtree(dta$features, dta$time, dta$id, dta$y, M = 300,
##D                  cv.flag = TRUE, importance = TRUE)
##D plot(boost.cv.grow)
##D print(boost.cv.grow)
##D vimpPlot(object = boost.cv.grow, ymaxlim = 20, ymaxtimelim = 20,
##D          xaxishead = c(3,3), yaxishead = c(65,65),
##D          cex.xlab = 1, subhead.cexval = 1.2)
##D ##----------------------------------------------------------------------------
##D ## spirometry data
##D ##----------------------------------------------------------------------------
##D data(spirometry, package = "boostmtree")
##D 
##D #boosting call: cubic B-splines with 15 knots
##D spr.obj <- boostmtree(spirometry$features, spirometry$time, spirometry$id, spirometry$y,
##D                         M = 100, nu = .025, nknots = 15)
##D plot(spr.obj)
##D 
##D 
##D ##----------------------------------------------------------------------------
##D ## sneaky way to use boostmtree for (univariate) regression: boston housing
##D ##----------------------------------------------------------------------------
##D 
##D if (library("mlbench", logical.return = TRUE)) {
##D 
##D   ## assemble the data
##D   data(BostonHousing)
##D   x <- BostonHousing; x$medv <- NULL
##D   y <- BostonHousing$medv
##D   trn <- sample(1:nrow(x), size = nrow(x) * (2 / 3), replace = FALSE)
##D 
##D   ## run boosting in univariate mode
##D   o <- boostmtree(x = x[trn,], y = y[trn])
##D   o.p <- predict(o, x = x[-trn, ], y = y[-trn])
##D   print(o)
##D   plot(o.p)
##D 
##D   ## run boosting in univariate mode to obtain RMSE and vimp
##D   o.cv <- boostmtree(x = x, y = y, M = 100, cv.flag = TRUE, importance = TRUE)
##D   print(o.cv)
##D   plot(o.cv)
##D   vimpPlot(o.cv,ymaxlim = 10,cex.xlab = 1)
##D }
##D 
## End(Not run)


