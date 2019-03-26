library(convevol)


### Name: allmaxdist
### Title: Calculates maxdist for all pairs of taxa in a phylogeny.
### Aliases: allmaxdist

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
answer<-allmaxdist(phyl,phendata,mat=TRUE)



