library(GABi)


### Name: GABi
### Title: Genetic Algorithm for Generalized Biclustering
### Aliases: GABi

### ** Examples

## create a binary array
x <- array(round(runif(1200)),dim=c(100,12))
## Not run: x

## use GABi to find biclusters
x.bc <- GABi(x,maxNgens=20)
## Not run: x.bc



