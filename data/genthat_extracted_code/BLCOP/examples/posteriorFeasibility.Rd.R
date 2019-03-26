library(BLCOP)


### Name: posteriorFeasibility
### Title: Calculate the "feasibility" of the (Black-Litterman) posterior
###   mean
### Aliases: posteriorFeasibility
### Keywords: math

### ** Examples

    pickMatrix <- matrix(c(rep(1/2, 2), -1,  rep(0, 3)), nrow = 1, ncol = 6 )
    views <- BLViews(P = pickMatrix, q = 0.08,confidences =  100, 
	                 assetNames = colnames(monthlyReturns))
    marketPosterior <- BLPosterior(monthlyReturns, views, marketIndex = sp500Returns, 
        riskFree = US13wTB)
    posteriorFeasibility(marketPosterior)



