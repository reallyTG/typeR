library(dataPreparation)


### Name: setColAsDate
### Title: Set columns as POSIXct
### Aliases: setColAsDate

### ** Examples

# Lets build a dataSet set
dataSet <- data.frame(ID = 1:5, 
                  date1 = c("2015-01-01", "2016-01-01", "2015-09-01", "2015-03-01", "2015-01-31"), 
                  date2 = c("2015_01_01", "2016_01_01", "2015_09_01", "2015_03_01", "2015_01_31")
                  )

# Using setColAsDate for date2
data_transformed <- setColAsDate(dataSet, cols = "date2", format = "%Y_%m_%d")

# Control the results
lapply(data_transformed, class)

# With multiple formats:
data_transformed <- setColAsDate(dataSet, format = list(date1 = "%Y-%m-%d", date2 = "%Y_%m_%d"))
lapply(data_transformed, class)

# It also works with timestamps
dataSet <- data.frame(time_stamp = c(1483225200, 1485990000, 1488495600))
setColAsDate(dataSet, cols = "time_stamp", format = "s")



