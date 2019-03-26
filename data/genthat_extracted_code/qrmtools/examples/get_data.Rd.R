library(qrmtools)


### Name: get_data
### Title: Tools for Getting and Working with Data
### Aliases: get_data
### Keywords: manip

### ** Examples

## Not run: 
##D     ## Note: This needs a working internet connection
##D     ## Get stock and volatility data (for all available trading days)
##D     dat <- get_data(c("^GSPC", "^VIX")) # note: this needs a working internet connection
##D     ## Plot them (Alternative: plot.xts() from xtsExtra)
##D     library(zoo)
##D     plot.zoo(dat, screens = 1, main = "", xlab = "Trading day", ylab = "Value")
## End(Not run)



