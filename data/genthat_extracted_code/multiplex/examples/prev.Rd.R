library(multiplex)


### Name: prev
### Title: Preview of the Semigroup Construction
### Aliases: prev
### Keywords: algebra math

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )

## preview it
prev(arr)




