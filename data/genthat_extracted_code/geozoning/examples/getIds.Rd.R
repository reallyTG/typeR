library(geozoning)


### Name: getIds
### Title: getIds
### Aliases: getIds
### Keywords: internal

### ** Examples

## No test: 
data(mapTest)
criti=correctionTree(c(0.4,0.5),mapTest,SAVE=TRUE)
Z=criti$zk[[2]][[1]]$zonePolygon
geozoning:::getIds(Z)
## End(No test)



