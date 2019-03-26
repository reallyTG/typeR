library(seasonal)


### Name: plot.seas
### Title: Seasonal Adjustment Plots
### Aliases: plot.seas residplot monthplot.seas

### ** Examples

## Not run: 
##D 
##D m <- seas(AirPassengers)
##D 
##D plot(m)  
##D plot(m, outliers = FALSE)  
##D plot(m, trend = TRUE) 
##D 
##D residplot(m)
##D residplot(m, outliers = FALSE)  
##D 
##D monthplot(m)
##D 
##D # use standard R functions to analyze "seas" models
##D pacf(resid(m))
##D spectrum(diff(resid(m)))
##D plot(density(resid(m)))
##D qqnorm(resid(m))
## End(Not run)



