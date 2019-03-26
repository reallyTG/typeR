library(geozoning)


### Name: getZoneId
### Title: getZoneId
### Aliases: getZoneId

### ** Examples

## No test: 
data(mapTest)
criti=correctionTree(c(0.4,0.5),mapTest,SAVE=TRUE)
Z=criti$zk[[2]][[1]]$zonePolygon
getZoneId(Z[[4]])
## End(No test)



