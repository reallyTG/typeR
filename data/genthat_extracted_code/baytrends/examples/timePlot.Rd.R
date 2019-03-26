library(baytrends)


### Name: timePlot
### Title: Time-series Plots
### Aliases: timePlot timePlot,Date,numeric-method
###   timePlot,POSIXt,numeric-method timePlot,numeric,numeric-method
###   timePlot,integer,numeric-method timePlot,difftime,numeric-method
###   timePlot,Date,numeric-method timePlot,POSIXt,numeric-method
###   timePlot,numeric,numeric-method timePlot,integer,numeric-method
###   timePlot,difftime,numeric-method
### Keywords: hplot internal methods

### ** Examples

## Not run: 
##D # the months function is in lubridate
##D X <- as.Date("2001-01-15") + months(0:11)
##D set.seed(1)
##D Y <- runif(12)
##D setGD()
##D timePlot(X, Y)
##D # For more details of timePlot see
##D vignette(topic="DateAxisFormats", package="smwrGraphs")
##D vignette(topic="LineScatter", package="smwrGraphs")
##D demo(topic="AnnualFlowBarChart", package="smwrGraphs")
##D demo(topic="DurationHydrograph", package="smwrGraphs")
##D demo(topic="HydroPrecip", package="smwrGraphs")
##D demo(topic="RightAxisExample", package="smwrGraphs")
## End(Not run)



