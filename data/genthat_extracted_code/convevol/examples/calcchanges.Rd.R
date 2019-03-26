library(convevol)


### Name: calcchanges
### Title: Calculates all phenotypic changes that occur on all branches of
###   a phylogeny.
### Aliases: calcchanges

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=5)
changes<-calcchanges(phyl,phendata)



