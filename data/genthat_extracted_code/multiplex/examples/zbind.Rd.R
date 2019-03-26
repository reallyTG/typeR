library(multiplex)


### Name: zbind
### Title: Combine Arrays
### Aliases: zbind
### Keywords: manip array

### ** Examples

## Create the data: two sets with a pair of binary relations 
## among three elements
arr1 <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
        c(3, 3, 2) ) > .5, 3 ) )

arr2 <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
        c(3, 3, 2) ) > .5, 3 ) )

## bind the data sets
zbind(arr1, arr2)



