library(multiplex)


### Name: bundles
### Title: Bundle Class Patterns
### Aliases: bundles
### Keywords: list data attribute math

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.8, 3 ) )

## Establish the different bundles
bundles(arr)




