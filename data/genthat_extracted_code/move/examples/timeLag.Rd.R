library(move)


### Name: timeLag
### Title: Time lags between the locations of a movement track
### Aliases: timeLag timeLag,.MoveTrackSingle-method
###   timeLag,.MoveTrackStack-method

### ** Examples

## time lags from a Move object 
data(leroy)
head(timeLag(leroy, units="hours"))
# to add this information to the move object, a "NA" has to be assigened
# e.g. to the first location (it also could be assigend to the first location).
leroy$timeLag <- c(timeLag(leroy, units="hours"), NA)

## time lags from a MoveStack object
data(fishers)
str(timeLag(fishers, units="mins"))
# to add this information to the moveStack object, a "NA" has to be assigened
# e.g. to the duration is assigned to the first location of each segment
fishers$timeLag <- unlist(lapply(timeLag(fishers, units="mins"),  c, NA))



