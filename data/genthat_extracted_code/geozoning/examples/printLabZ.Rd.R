library(geozoning)


### Name: printLabZ
### Title: printLabZ
### Aliases: printLabZ

### ** Examples

data(mapTest)
qProb=c(0.1,0.2,0.4);criti=correctionTree(qProb,mapTest) # 2 zonings at last level
printLabZ(criti$zk[[2]])



