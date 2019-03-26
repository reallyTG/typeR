library(move)


### Name: speed
### Title: Speed between the locations of a movement track
### Aliases: speed speed,.MoveTrackSingle-method
###   speed,.MoveTrackStack-method

### ** Examples

# speeds from a Move object 
data(leroy)
head(speed(leroy))
# to add this information to the move object, a "NA" has to be assigened
#  e.g. to the last location (it also could be assigend to the first location).
leroy$speed <- c(speed(leroy), NA)

## speeds from a MoveStack object
data(fishers)
str(speed(fishers))
# to add this information to the moveStack object, a "NA" has to be assigened
# e.g. to the last location of each individual (the speed belongs to the following segment).
fishers$speed <- unlist(lapply(speed(fishers),c, NA ))



