library(geozoning)


### Name: correctionTree
### Title: correctionTree - builds a binary tree of small zone corrections
### Aliases: correctionTree

### ** Examples

data(mapTest)
criti=correctionTree(c(0.4,0.7),mapTest,SAVE=TRUE) 
plotZ(criti$zk[[1]][[1]]$zonePolygone)
plotZ(criti$zk[[2]][[1]]$zonePolygone) # zones 7 and 8 were handled




