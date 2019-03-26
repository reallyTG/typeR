library(move)


### Name: timestamps
### Title: Extract or set the timestamps of a Move or MoveStack object
### Aliases: timestamps timestamps<- timestamps,.MoveTrack-method
###   timestamps,.unUsedRecords-method timestamps,.MoveTrackSingle-method
###   timestamps<-,.MoveTrack-method

### ** Examples

data(leroy)
data(fishers)

## get the timestamps from a Move object
head(timestamps(leroy)) 
## get the timestamps from a MoveStack object
head(timestamps(fishers)) 
## get the timestamps from a unUsedRecords object
head(timestamps(unUsedRecords(leroy)))  

## get timestamps separatly for each individual from a MoveStack 
str(lapply(split(fishers), timestamps))

## change the timestamps and set it for a Move object
timestamps(leroy) <- timestamps(leroy)+60 
## change the timestamps and set it for a MoveStack object
timestamps(fishers) <- timestamps(fishers)+60.1



