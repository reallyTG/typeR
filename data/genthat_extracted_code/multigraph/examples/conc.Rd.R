library(multigraph)


### Name: conc
### Title: Concentric layout
### Aliases: conc
### Keywords: graphics manip

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 3 ) )

## Coordinates for the concentric layout with two radii
coord <- conc(arr, nr = 2)

## Plot multigraph with costumized coordenates
multigraph(arr, coord = coord)




