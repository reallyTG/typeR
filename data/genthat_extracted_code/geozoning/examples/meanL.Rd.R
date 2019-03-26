library(geozoning)


### Name: meanL
### Title: meanL
### Aliases: meanL

### ** Examples

data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7,
# saving initial zoning and last level zonings
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=TRUE)
K=criti$zk[[2]][[1]]
uni=unique(K$lab)
zlab=sapply(uni,function(x){(1:length(K$lab))[K$lab==x]})
resL=meanL(zlab,K$listZonePoint,mapTest$krigData,mapTest$krigSurfVoronoi)



