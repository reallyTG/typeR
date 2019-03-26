library(geozoning)


### Name: sortCrit
### Title: sortCrit called by correctionTree
### Aliases: sortCrit
### Keywords: internal

### ** Examples

data(mapTest)
qProb=c(0.4,0.7)
criti=correctionTree(qProb,mapTest)
# displays best criterion, corresponding costs and number of zones
geozoning:::sortCrit(qProb,criti$criterion,criti$cost,criti$costL,
            criti$nz,criti$mdist,criti$zk,mapTest)



