library(move)


### Name: as.data.frame
### Title: Returns a Data Frame
### Aliases: as.data.frame as.data.frame,Move-method
###   as.data.frame,MoveStack-method as.data.frame,MoveBurst-method
###   as.data.frame,dBMvariance-method as.data.frame,.unUsedRecords-method
###   as.data.frame,.unUsedRecordsStack-method

### ** Examples

## obtain data.frame from move object
data(leroy)
head(as.data.frame(leroy))

## obtain data.frame from moveStack object
data(fishers)
head(as.data.frame(fishers))

## obtain data.frame from .unUsedRecordsStack object
unUsedFishers <- unUsedRecords(fishers)
head(as.data.frame(unUsedFishers))



