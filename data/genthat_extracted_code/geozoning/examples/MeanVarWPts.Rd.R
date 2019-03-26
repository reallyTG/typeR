library(geozoning)


### Name: MeanVarWPts
### Title: MeanVarWPts
### Aliases: MeanVarWPts

### ** Examples

data(resZTest)
K=resZTest
Z=K$zonePolygone
data(mapTest)
MeanVarWPts(mapTest,Z[[1]])
# Weights are areas of the Voronoi polygons corresponding to data points
MeanVarWPts(mapTest,Z[[1]],mapTest$krigSurfVoronoi) #slightly different result



