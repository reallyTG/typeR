library(convevol)


### Name: maxdist
### Title: Calculates the maximum phenotypic distance between the lineages
###   leading to a pair of taxa.
### Aliases: maxdist

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
answer<-maxdist(phyl,phendata,1,10)



