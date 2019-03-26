library(openair)


### Name: smoothTrend
### Title: Calculate nonparametric smooth trends
### Aliases: smoothTrend
### Keywords: methods

### ** Examples


# load example data from package
data(mydata)

# trend plot for nox
smoothTrend(mydata, pollutant = "nox")

# trend plot by each of 8 wind sectors
## Not run: smoothTrend(mydata, pollutant = "o3", type = "wd", ylab = "o3 (ppb)")

# several pollutants, no plotting symbol
## Not run: smoothTrend(mydata, pollutant = c("no2", "o3", "pm10", "pm25"), pch = NA)

# percentiles
## Not run: 
##D smoothTrend(mydata, pollutant = "o3", statistic = "percentile",
##D percentile = 95)
## End(Not run)

# several percentiles with control over lines used
## Not run: 
##D smoothTrend(mydata, pollutant = "o3", statistic = "percentile",
##D percentile = c(5, 50, 95), lwd = c(1, 2, 1), lty = c(5, 1, 5))
## End(Not run)




