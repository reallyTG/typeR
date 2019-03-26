library(multigraph)


### Name: frcd
### Title: Force directed layout
### Aliases: frcd
### Keywords: graphics manip

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## Coordinates for the force directed layout with random start
coord <- frcd(arr, seed = NULL)

## Plot multigraph with costumized coordenates
multigraph(arr, coord = coord)




