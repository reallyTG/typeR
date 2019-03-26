library(multiplex)


### Name: edgeT
### Title: Edge Table Generator
### Aliases: edgeT
### Keywords: algebra

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )

## get the edge table
edgeT(arr)



