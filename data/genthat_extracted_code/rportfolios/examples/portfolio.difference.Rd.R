library(rportfolios)


### Name: portfolio.difference
### Title: Portfolio Difference Measure
### Aliases: portfolio.difference
### Keywords: math

### ** Examples

onePortfolio <- random.longonly( 100, 75 )
aBenchmark <- rep( 0.01, 100 )
portfolio.difference( onePortfolio, aBenchmark, method="absolute" )
portfolio.difference( onePortfolio, aBenchmark, method="relative" )



