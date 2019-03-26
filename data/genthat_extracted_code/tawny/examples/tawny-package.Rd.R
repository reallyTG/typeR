library(tawny)


### Name: tawny-package
### Title: Clean Covariance Matrices Using Random Matrix Theory and
###   Shrinkage Estimators for Portfolio Optimization
### Aliases: tawny-package tawny
### Keywords: package ts

### ** Examples

## Not run: 
##D # Select a portfolio using 200 total observations
##D data(sp500.subset)
##D h <- sp500.subset
##D p <- TawnyPortfolio(h, 150)
##D b <- BenchmarkPortfolio('^GSPC', 150, nrow(h), end=end(h))
##D 
##D # Optimize using a window of length 200 (there will be 51 total iterations)
##D ws <- optimizePortfolio(p, RandomMatrixDenoiser())
##D rs <- PortfolioReturns(p, ws)
##D o <- zoo(cbind(portfolio=rs, benchmark=b$returns), index(rs))
##D charts.PerformanceSummary(o)
##D 
##D 
##D # Generate weights based on the constant correlation shrinkage estimator
##D ws <- optimizePortfolio(p, ShrinkageDenoiser())
##D rs <- PortfolioReturns(p, ws)
##D o <- zoo(cbind(portfolio=rs, benchmark=b$returns), index(rs))
##D charts.PerformanceSummary(o)
## End(Not run)




