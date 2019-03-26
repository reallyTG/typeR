library(multiplex)


### Name: as.strings
### Title: Coerce an Object to a Strings Class
### Aliases: as.strings
### Keywords: algebra array

### ** Examples

## Create the data: two sets with a pair of binary relations among 
## three elements
arr1 <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
        c(3,3,2))>.5, 3 ) )

arr2 <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
        c(3,3,2))>.5, 3 ) )

## bind the data sets
arrs <- zbind(arr1, arr2)

## make the data a strings object
as.strings(arrs)




