library(move)


### Name: idData
### Title: Obtain or replace the idData slot of a Move object
### Aliases: idData idData<- idData<-,.MoveTrack,ANY,ANY,ANY-method
###   idData<-,.MoveTrack,missing,missing,data.frame-method
###   idData,.MoveTrack-method

### ** Examples

data(fishers)
idData(fishers)

## obtain e.g. only the tag and individual identifier columns
idData(fishers, j=c(6,7))
idData(fishers, j=c("tag.local.identifier", "individual.local.identifier"))



