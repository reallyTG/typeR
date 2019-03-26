library(geozoning)


### Name: findZCenterpt
### Title: findZCenterpt
### Aliases: findZCenterpt
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
# run zoning with 2 quantiles corresponding to probability values 0.4 and 0.7,
# saving initial zoning and last level zonings
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=TRUE)
K=criti$zk[[2]][[1]]
data=mapTest$krigData
geozoning:::findZCenterpt(data,K)
## End(No test)



