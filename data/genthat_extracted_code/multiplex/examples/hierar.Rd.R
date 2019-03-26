library(multiplex)


### Name: hierar
### Title: Person and Relation Hierarchy
### Aliases: hierar
### Keywords: algebra math

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
c(3, 3, 2) ) > .5, 3 ) )

## The relation box
rarr <- rbox(arr, k=1)

## Calculated the person hierarchy of a random actor
hierar(rarr, ceiling(runif(1, min=0, max=dim(arr)[2])))




