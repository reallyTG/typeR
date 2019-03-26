library(geozoning)


### Name: Identify
### Title: Identify
### Aliases: Identify

### ** Examples

## No test: 
data(mapTest)
criti=correctionTree(c(0.4,0.5),mapTest,SAVE=TRUE)
Z=criti$zk[[2]][[1]]$zonePolygon
Identify(6,Z)
## End(No test)



