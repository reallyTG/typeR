library(ASMap)


### Name: fixClones
### Title: Consensus genotypes for clonal genotype groups
### Aliases: fixClones
### Keywords: misc

### ** Examples


data(mapDH, package = "ASMap")

gc <- genClones(mapDH)
mapDHf <- fixClones(mapDH, gc$cgd, consensus = TRUE)




