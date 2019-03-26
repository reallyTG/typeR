library(TrafficBDE)


### Name: PreProcessingLink
### Title: PreProcessing second model
### Aliases: PreProcessingLink

### ** Examples

SpecLink <- loadDataSpecLink("163204843","1", X163204843_1)
x <- fillMissingValues(SpecLink)
datetime <- "2017-01-27 14:00:00" 
newData <- fillMissingDates (x, datetime)
DataList <- loadTrainTest (newData, datetime, "Mean_speed")
List <- PreProcessingLink(DataList)




