library(move)


### Name: subset-method
### Title: Subset movement tracks
### Aliases: [,dBGBvariance,ANY,ANY-method [,MoveStack,ANY,ANY-method
###   [,.MoveTrack,ANY,ANY-method [<-,.MoveTrack,ANY,ANY-method
###   [,.MoveTrackSingleBurst,ANY,ANY-method
###   [,.MoveTrackStack,ANY,ANY-method [,dBMvariance,ANY,ANY-method
###   [,dBMvarianceStack,ANY,ANY-method [,dBMvarianceBurst,ANY,ANY-method
###   [,.unUsedRecordsStack,ANY,ANY-method [,.unUsedRecords,ANY,ANY-method
###   [[,MoveStack,character,missing-method
###   [[,.MoveTrackStack,character,missing-method
###   [[,.MoveTrackStack,logical,missing-method
###   [[,.MoveTrackStack,numeric,missing-method

### ** Examples

## subseting a Move, MoveBurst, DBBMM, dBMvariance, dBMvarianceBurst, 
## dBMvarianceStack or dBGBvariance object by locations
data(leroy)
leroy[1:20,] # subset to selected range of coordinates of a move objects
leroy[c(1,10,20),] # subset to selected coordinates of a move objects
leroy[c(TRUE,FALSE),] # subset to every second location
leroy[c(TRUE,FALSE,FALSE),] # subset to every third location

## subseting a moveStack, DBBMMStack or DBBMMBurstStack object, 
## by locations 
data(fishers)
# subset to selected range of coordinates of a moveStack objects. If the first individual contains
# more than, in this case 300, locations, only locations of the fist individual will be returned
fishers[1:300,] 
fishers[1] # returns first location of first individual

## or individuals
fishers[['Ricky.T']] # returns move object of named individual
fishers[[c('Leroy','Ricky.T')]] # returns subseted moveStack only with the named individual
fishers[[2]] # returns move object of 2nd individual
fishers[[c(1,2)]]# returns subseted moveStack only with the selected individual

fishers[[c(TRUE,FALSE)]] # returnes move or moveStack object with those individuals that are 'TRUE'



