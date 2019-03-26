library(tawny)


### Name: optimizePortfolio
### Title: Optimize a portfolio using the specified correlation filter
### Aliases: optimizePortfolio p.optimize
### Keywords: ts

### ** Examples

require(tawny.types)
data(sp500.subset)

p <- TawnyPortfolio(sp500.subset, window=190)
ws <- optimizePortfolio(p, SampleDenoiser() )
ws <- optimizePortfolio(p, EmpiricalDenoiser() )
ws <- optimizePortfolio(p, RandomMatrixDenoiser() )
ws <- optimizePortfolio(p, ShrinkageDenoiser() )

## Not run: 
##D # This is computationally faster although the convenient approach is to pass
##D # in the character symbol directly: ShrinkageDenoiser(market='^GSPC')
##D m <- getPortfolioReturns('^GSPC', obs=1000, end='2009-02-27')
##D ws <- optimizePortfolio(p, ShrinkageDenoiser(market=m) )
## End(Not run)



