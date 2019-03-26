library(TrafficBDE)


### Name: TrainCR
### Title: Train
### Aliases: TrainCR

### ** Examples

## Not run: 
##D SpecLink <- loadDataSpecLink("163204843","1", X163204843_1)
##D x <- fillMissingValues(SpecLink)
##D datetime <- "2017-01-27 14:00:00" 
##D newData <- fillMissingDates (x, datetime)
##D DataList <- loadTrainTest (newData, datetime, "Mean_speed")
##D List <- PreProcessingLink(DataList)
##D NNout <- TrainCR (List,"Mean_speed")
## End(Not run)




