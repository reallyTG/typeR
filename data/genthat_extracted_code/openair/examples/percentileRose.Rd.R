library(openair)


### Name: percentileRose
### Title: Function to plot percentiles by wind direction
### Aliases: percentileRose
### Keywords: methods

### ** Examples


# basic percentile plot
percentileRose(mydata, pollutant = "o3")

# 50/95th percentiles of ozone, with different colours
percentileRose(mydata, pollutant = "o3", percentile = c(50, 95), col = "brewer1")

## Not run: 
##D # percentiles of ozone by year, with different colours
##D percentileRose(mydata, type = "year", pollutant = "o3", col = "brewer1")
##D 
##D # percentile concentrations by season and day/nighttime..
##D percentileRose(mydata, type = c("season", "daylight"), pollutant = "o3", col = "brewer1")
## End(Not run)





