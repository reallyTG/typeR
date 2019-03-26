library(openair)


### Name: timeAverage
### Title: Function to calculate time averages for data frames
### Aliases: timeAverage
### Keywords: methods

### ** Examples


## daily average values
daily <- timeAverage(mydata, avg.time = "day")

## daily average values ensuring at least 75 % data capture
## i.e. at least 18 valid hours
## Not run: daily <- timeAverage(mydata, avg.time = "day", data.thresh = 75)

## 2-weekly averages
## Not run: fortnight <- timeAverage(mydata, avg.time = "2 week")

## make a 15-minute time series from an hourly one
## Not run: 
##D min15 <-  timeAverage(mydata, avg.time = "15 min", fill = TRUE)
## End(Not run)

# average by grouping variable
## Not run: 
##D dat <- importAURN(c("kc1", "my1"), year = 2011:2013)
##D timeAverage(dat, avg.time = "year", type = "site")
##D 
##D # can also retain site code
##D timeAverage(dat, avg.time = "year", type = c("site", "code"))
##D 
##D # or just average all the data, dropping site/code
##D timeAverage(dat, avg.time = "year")
## End(Not run)



