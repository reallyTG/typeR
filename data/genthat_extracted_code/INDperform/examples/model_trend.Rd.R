library(INDperform)


### Name: model_trend
### Title: Modeling of indicator trends
### Aliases: model_trend

### ** Examples

# Using the Baltic Sea demo data in this package
ind_tbl <- ind_ex[ ,-1] # excluding the year
time <- ind_ex$Year
# Using the default settings
trend_tbl <- model_trend(ind_tbl, time)
# Change the training and test data assignment
model_trend(ind_tbl, time, train = .5, random = TRUE)
# To keep the name when testing only one indicator, coerce vector to data frame
model_trend(data.frame(MS = ind_tbl$MS), time, train = .5, random = TRUE)



