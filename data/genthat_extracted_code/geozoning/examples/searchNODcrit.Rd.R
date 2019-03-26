library(geozoning)


### Name: searchNODcrit
### Title: searchNODcrit
### Aliases: searchNODcrit
### Keywords: internal

### ** Examples

qProb=c(0.1,0.2);criti=correctionTree(qProb,mapTest)
res=geozoning:::searchNODcrit(qProb,2,criti$zk,criti$criterion,criti$cost,criti$costL,criti$nz)



