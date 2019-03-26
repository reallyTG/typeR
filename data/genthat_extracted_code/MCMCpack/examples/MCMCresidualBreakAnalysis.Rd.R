library(MCMCpack)


### Name: MCMCresidualBreakAnalysis
### Title: Break Analysis of Univariate Time Series using Markov Chain
###   Monte Carlo
### Aliases: MCMCresidualBreakAnalysis
### Keywords: models

### ** Examples


## Not run: 
##D line   <- list(X = c(-2,-1,0,1,2), Y = c(1,3,3,3,5))
##D ols <- lm(Y~X)
##D residual <-   rstandard(ols)
##D posterior  <- MCMCresidualBreakAnalysis(residual, m = 1, data=line, mcmc=1000, verbose=200)
##D plotState(posterior)
##D summary(posterior)
## End(Not run)




