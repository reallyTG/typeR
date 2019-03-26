library(tawny.types)


### Name: TawnyPortfolio
### Title: Create a TawnyPortfolio object
### Aliases: TawnyPortfolio BenchmarkPortfolio PortfolioReturns
###   start.TawnyPortfolio end.TawnyPortfolio rollapply.TawnyPortfolio
###   window_at

### ** Examples

  ## Not run: 
##D   p <- TawnyPortfolio(c('BAC','JPM','C','GS','MS'))
##D 
##D   start(p)
##D   end(p)
##D 
##D   window_at(p, 2)
##D   rollapply(p, function(x) colSums(x$returns))
##D   
## End(Not run)



