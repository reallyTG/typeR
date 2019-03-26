library(openair)


### Name: calcPercentile
### Title: Calculate percentile values from a time series
### Aliases: calcPercentile
### Keywords: methods

### ** Examples



# 95th percentile monthly o3 concentrations
percentiles <- calcPercentile(mydata, pollutant ="o3",
avg.time = "month", percentile = 95)

head(percentiles)

# 5, 50, 95th percentile monthly o3 concentrations
## Not run: 
##D percentiles <- calcPercentile(mydata, pollutant ="o3",
##D avg.time = "month", percentile = c(5, 50, 95))
##D 
##D head(percentiles)
## End(Not run)




