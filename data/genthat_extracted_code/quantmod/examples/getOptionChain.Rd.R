library(quantmod)


### Name: getOptionChain
### Title: Download Option Chains
### Aliases: getOptionChain
### Keywords: utilities

### ** Examples

## Not run: 
##D # Only the front-month expiry
##D AAPL.OPT <- getOptionChain("AAPL")
##D # All expiries
##D AAPL.OPTS <- getOptionChain("AAPL", NULL)
##D # All 2015 and 2016 expiries
##D AAPL.2015 <- getOptionChain("AAPL", "2015/2016")
## End(Not run)



