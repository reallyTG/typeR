library(move)


### Name: angle
### Title: Headings of the segments of a movement track
### Aliases: angle angle,.MoveTrackSingle-method
###   angle,.MoveTrackStack-method

### ** Examples

## angles from a Move object 
data(leroy)
head(angle(leroy))
# to add this information to the move object, a "NA" has to be assigened
# e.g. to the last location (it also could be assigend to the first location).
leroy$angles <- c(angle(leroy), NA)

## angles from a MoveStack object
data(fishers)
str(angle(fishers))
# to add this information to the moveStack object, a "NA" has to be assigened
# e.g. to the last location of each individual
fishers$angles <- unlist(lapply(angle(fishers), c, NA))



