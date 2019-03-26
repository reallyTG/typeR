library(dygraphs)


### Name: dyRibbon
### Title: dyRibbon plugin adds a horizontal band of colors that runs
###   through the chart. It can be useful to visualize categorical
###   variables (http://en.wikipedia.org/wiki/Categorical_variable) that
###   change over time (along the x-axis).
### Aliases: dyRibbon

### ** Examples

## Not run: 
##D library(quantmod)
##D 
##D getSymbols("SPY", from = "2016-12-01", auto.assign=TRUE)
##D 
##D difference <- SPY[, "SPY.Open"] - SPY[, "SPY.Close"]
##D decreasing <- which(difference < 0)
##D increasing <- which(difference > 0)
##D 
##D dyData <- SPY[, "SPY.Close"]
##D 
##D ribbonData <- rep(0, nrow(dyData))
##D ribbonData[decreasing] <- 0.5
##D ribbonData[increasing] <- 1
##D 
##D dygraph(dyData) %>%
##D     dyRibbon(data = ribbonData, top = 0.1, bottom = 0.02)
## End(Not run)




