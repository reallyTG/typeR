library(bfast)


### Name: bfast
### Title: Break Detection in the Seasonal and Trend Component of a
###   Univariate Time Series
### Aliases: bfast
### Keywords: ts

### ** Examples


## Not run: 
##D rm(list = ls())
##D install.packages("bfast", repos="http://R-Forge.R-project.org", type = "source")
##D update.packages(checkBuilt=TRUE)
##D # make sure all your package are up to date
##D # and built correctly for your current R version
## End(Not run)

## Simulated Data
plot(simts) # stl object containing simulated NDVI time series
datats <- ts(rowSums(simts$time.series))
# sum of all the components (season,abrupt,remainder)
tsp(datats) <- tsp(simts$time.series) # assign correct time series attributes
plot(datats)

## Not run: 
##D if (requireNamespace("forecast", quietly = TRUE)) {
##D       fit <- bfast(datats,h=0.15, season="dummy", max.iter=1)
##D       plot(fit,sim=simts)
##D       fit
##D       # prints out whether breakpoints are detected
##D       # in the seasonal and trend component
##D 
##D    } else {
##D       ## do something else not involving forecast related functions
##D       ## like seasonaldummy() and tsdisply()
##D    }
## End(Not run)


## Real data
## The data should be a regular ts() object without NA's
## See Fig. 8 b in reference
plot(harvest, ylab="NDVI")
# MODIS 16-day cleaned and interpolated NDVI time series

(rdist <- 10/length(harvest))
# ratio of distance between breaks (time steps) and length of the time series
## Not run: 
##D if (requireNamespace("forecast", quietly = TRUE)) {
##D   fit <- bfast(harvest,h=rdist, season="harmonic", max.iter=1,breaks=2)
##D   plot(fit)
##D   ## plot anova and slope of the trend identified trend segments
##D   #plot(fit, ANOVA=TRUE)
##D   ## plot the trend component and identify the break with
##D   ## the largest magnitude of change
##D   plot(fit,type="trend",largest=TRUE)
##D 
##D   ## plot all the different available plots
##D   plot(fit,type="all")
##D 
##D   ## output
##D   niter <- length(fit$output) # nr of iterations
##D   out <- fit$output[[niter]]
##D   # output of results of the final fitted seasonal and trend models and
##D   ## #nr of breakpoints in both.
##D 
##D   ## running bfast on yearly data
##D   t <- ts(as.numeric(harvest), frequency = 1, start = 2006)
##D   fit <- bfast(t, h = 0.23, season = "none", max.iter = 1)
##D   plot(fit)
##D   fit
##D }
## End(Not run)



