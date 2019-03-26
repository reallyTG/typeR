library(openair)


### Name: polarPlot
### Title: Function for plotting bivariate polar plots with smoothing.
### Aliases: polarPlot
### Keywords: methods

### ** Examples


# Use openair 'mydata'

# basic plot
polarPlot(openair::mydata, pollutant = "nox")

## Not run: 
##D 
##D # polarPlots by year on same scale
##D polarPlot(mydata, pollutant = "so2", type = "year", main = "polarPlot of so2")
##D 
##D # set minimum number of bins to be used to see if pattern remains similar
##D polarPlot(mydata, pollutant = "nox", min.bin = 3)
##D 
##D # plot by day of the week
##D polarPlot(mydata, pollutant = "pm10", type = "weekday")
##D 
##D # show the 95% confidence intervals in the surface fitting
##D polarPlot(mydata, pollutant = "so2", uncertainty = TRUE)
##D 
##D 
##D # Pair-wise statistics
##D # Pearson correlation
##D polarPlot(mydata, pollutant = c("pm25", "pm10"), statistic = "r")
##D 
##D # Robust regression slope, takes a bit of time
##D polarPlot(mydata, pollutant = c("pm25", "pm10"), statistic = "robust.slope")
##D 
##D # Least squares regression works too but it is not recommended, use robust
##D # regression
##D # polarPlot(mydata, pollutant = c("pm25", "pm10"), statistic = "slope")
##D 
## End(Not run)




