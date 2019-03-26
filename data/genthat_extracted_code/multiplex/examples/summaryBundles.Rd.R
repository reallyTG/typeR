library(multiplex)


### Name: summaryBundles
### Title: Summary of Bundle Classes
### Aliases: summaryBundles
### Keywords: print IO

### ** Examples

## Create the data: 2 binary relations among 3 elements
arr <- round( replace( array( runif(18), c(3 ,3, 2) ), array( runif(18),
c(3, 3, 2) ) > .8, 3 ) )

## Establish the different bundles
bd <- bundles(arr)

## Print the different relational bundles
summaryBundles(bd)




