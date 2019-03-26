library(move)


### Name: distance
### Title: Distance between the locations of a movement track
### Aliases: distance distance,.MoveTrackSingle,missing-method
###   distance,.MoveTrackStack,missing-method

### ** Examples

## distance from a Move object 
data(leroy)
head(distance(leroy))
# to add this information to the move object, a "NA" has to be assigened
# e.g. distance is assigned to the first location of a segment
leroy$distance <- c(distance(leroy), NA)

## distance from a MoveStack object
data(fishers)
str(distance(fishers))
# to add this information to the moveStack object, a "NA" has to be assigened
# e.g. distance is assigned to the first location of a segment
fishers$distance <- unlist(lapply(distance(fishers), c, NA))



