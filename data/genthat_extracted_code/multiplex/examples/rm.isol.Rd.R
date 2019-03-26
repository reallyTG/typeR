library(multiplex)


### Name: rm.isol
### Title: Remove Isolates
### Aliases: rm.isol
### Keywords: manip array

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
c(3, 3, 2) ) > .5, 3 ) )

## Remove isolates (if exist)
rm.isol(arr)



