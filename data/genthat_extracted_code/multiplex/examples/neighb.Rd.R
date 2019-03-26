library(multiplex)


### Name: neighb
### Title: Neighborhood of an actor or group of actors
### Aliases: neighb
### Keywords: models manip

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
       c(3, 3, 2) ) > .9, 3 ) )

## Determine the system of strong bonds
rs <- rel.sys(arr, bonds = "strong")

## the inmediate neighbourhood of the first node
neighb(1, rs)




