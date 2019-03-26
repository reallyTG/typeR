library(convevol)


### Name: multianc
### Title: Reconstructs ancestral states for multiple characters
### Aliases: multianc

### ** Examples


phyl<-rtree(10)

phendata<-fastBM(phyl,nsim=2)

ancs<-multianc(phyl,phendata)



