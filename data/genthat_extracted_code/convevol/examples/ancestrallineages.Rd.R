library(convevol)


### Name: ancestrallineages
### Title: Extracts lineages leading to two tips, t1 and t2, from their
###   most recent common ancestor.
### Aliases: ancestrallineages

### ** Examples


phyl<-rtree(10)
phendata<-fastBM(phyl,nsim=2)
answer<-ancestrallineages(phyl,phendata,"t1","t2")



