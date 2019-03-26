library(geozoning)


### Name: costLab
### Title: costLab
### Aliases: costLab

### ** Examples

data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7,
# saving initial zoning and last level zonings
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=TRUE)
K=criti$zk[[1]][[1]] # initial zoning
costLab(K,mapTest) #identical to criti$costL[[1]][[1]]



