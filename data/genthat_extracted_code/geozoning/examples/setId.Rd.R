library(geozoning)


### Name: setId
### Title: setId
### Aliases: setId

### ** Examples

## No test: 
data(mapTest)
criti=correctionTree(c(0.4,0.5),mapTest,SAVE=TRUE)
Z=criti$zk[[2]][[1]]$zonePolygon
Z1=setId(Z,4,"4")
## End(No test)



