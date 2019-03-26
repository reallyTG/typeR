library(boostmtree)


### Name: partialPlot
### Title: Partial plot analysis
### Aliases: partialPlot
### Keywords: plot

### ** Examples

## Not run: 
##D ##------------------------------------------------------------
##D ## Synthetic example
##D ## high correlation, quadratic time with quadratic interaction
##D ##-------------------------------------------------------------
##D #simulate the data
##D dta <- simLong(n = 50, N = 5, rho =.80, model = 2)$dtaL
##D 
##D #basic boosting call
##D boost.grow <- boostmtree(dta$features, dta$time, dta$id, dta$y, M = 300)
##D 
##D #plot results
##D #x1 has a linear main effect
##D #x2 is quadratic with quadratic time trend
##D partialPlot(boost.grow, "x1")
##D partialPlot(boost.grow, "x2")
##D 
##D #partial plot using "x2" as the conditional variable
##D partialPlot(boost.grow, "x1", conditional.xvar = "x2", conditional.values = 1)
##D partialPlot(boost.grow, "x1", conditional.xvar = "x2", conditional.values = 2)
##D 
##D ##----------------------------------------------------------------------------
##D ## spirometry data
##D ##----------------------------------------------------------------------------
##D data(spirometry, package = "boostmtree")
##D 
##D #boosting call: cubic B-splines with 15 knots
##D spr.obj <- boostmtree(spirometry$features, spirometry$time, spirometry$id, spirometry$y,
##D             M = 300, nu = .025, nknots = 15)
##D 
##D #partial plot of double-lung group at 5 years
##D dltx <- partialPlot(spr.obj, "AGE", tm = 5, subset=spr.obj$x$DOUBLE==1)
##D 
##D #partial plot of single-lung group at 5 years
##D sltx <- partialPlot(spr.obj, "AGE", tm = 5, subset=spr.obj$x$DOUBLE==0)
##D 
##D #combine the two plots: we use lowess smoothed values
##D dltx <- dltx$l.obj[[1]]
##D sltx <- sltx$l.obj[[1]]
##D plot(range(c(dltx[, 1], sltx[, 1])), range(c(dltx[, -1], sltx[, -1])),
##D      xlab = "age", ylab = "predicted y (adjusted)", type = "n")
##D lines(dltx[, 1], dltx[, -1], lty = 1, lwd = 2, col = "red")
##D lines(sltx[, 1], sltx[, -1], lty = 1, lwd = 2, col = "blue")
##D legend("topright", legend = c("DLTx", "SLTx"), lty = 1, fill = c(2,4))
## End(Not run)



