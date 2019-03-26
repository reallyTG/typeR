library(geozoning)


### Name: SigmaL2
### Title: SigmaL2
### Aliases: SigmaL2

### ** Examples

## No test: 
data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7
# save initial zoning and last level zonings
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=TRUE)
K=criti$zk[[2]][[1]]
uni=unique(K$lab)
zlab=sapply(uni,function(x){(1:length(K$lab))[K$lab==x]})
sig=SigmaL2(zlab,K$listZonePoint,mapTest$krigData,mapTest$krigSurfVoronoi)
## End(No test)



