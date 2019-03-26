library(move)


### Name: turnAngleGc
### Title: Turning angles on great circle tracks
### Aliases: turnAngleGc turnAngleGc,.MoveTrackSingle-method
###   turnAngleGc,.MoveTrackStack-method

### ** Examples

## turnAngleGc from a Move object 
data(leroy)
head(turnAngleGc(leroy))
# to add this information to the move object, a "NA" has to be assigened
# to the first and last location.
leroy$turnAngleGc <- c(NA, turnAngleGc(leroy), NA)

## turnAngleGc from a MoveStack object
data(fishers)
str(turnAngleGc(fishers))
# to add this information to the moveStack object, a "NA" has to be assigened
# to the first and last location of each individual
fishers$turnAngleGc <-unlist(lapply(turnAngleGc(fishers), function(x) c(NA, x, NA)))



