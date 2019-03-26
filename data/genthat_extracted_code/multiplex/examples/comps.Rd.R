library(multiplex)


### Name: comps
### Title: Find components in multiple networks
### Aliases: comps
### Keywords: models cluster

### ** Examples

## Create the data: two binary relations among three elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
       c(3, 3, 2) ) > .9, 3 ) )

## Find components ans isolates
comps(arr)




