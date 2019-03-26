library(spam)


### Name: UScounties
### Title: Adjacency structure of the counties in the contiguous United
###   States
### Aliases: UScounties UScounties.storder UScounties.ndorder
### Keywords: datasets

### ** Examples

# number of counties:
n  <- nrow( UScounties.storder)

## Not run: 
##D # make a precision matrix 
##D Q <- diag.spam( n) + .2 * UScounties.storder + .1 * UScounties.ndorder
##D display( as.spam( chol( Q)))
## End(Not run)



