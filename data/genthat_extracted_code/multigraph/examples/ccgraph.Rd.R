library(multigraph)


### Name: ccgraph
### Title: Cayley colour graph
### Aliases: ccgraph
### Keywords: graphics math

### ** Examples

## Create an abstract semigroup
arr <- round( replace( array(runif(18), c(3,3,2)), array(runif(18),
       c(3,3,2))>.5, 1 ) )
S <- semigroup(arr)

## plot its Cayley graph
ccgraph(S)



