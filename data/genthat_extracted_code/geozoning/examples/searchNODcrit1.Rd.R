library(geozoning)


### Name: searchNODcrit1
### Title: searchNODcrit1
### Aliases: searchNODcrit1

### ** Examples

data(mapTest)
qProb=c(0.1,0.2,0.4);criti=correctionTree(qProb,mapTest) # 2 zonings at last level
res=searchNODcrit1(qProb,criti)# best one is frist element of last level



