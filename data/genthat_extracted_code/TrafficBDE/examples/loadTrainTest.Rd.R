library(TrafficBDE)


### Name: loadTrainTest
### Title: Load Train and Test Data
### Aliases: loadTrainTest

### ** Examples

SpecLink <- loadDataSpecLink("163204843","1", X163204843_1)
x <- fillMissingValues(SpecLink)
datetime <- "2017-01-27 14:00:00" 
newData <- fillMissingDates (x, datetime)
DataList <- loadTrainTest (newData, datetime, "Mean_speed")




