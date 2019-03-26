library(bamlss)


### Name: neighbormatrix
### Title: Compute a Neighborhood Matrix from Spatial Polygons
### Aliases: neighbormatrix plotneighbors
### Keywords: models regression aplot

### ** Examples

data("LondonFire")

## Compute polygon boundary based
## neighborhood matrix.
nm <- neighbormatrix(LondonBoroughs)
print(nm)

## Plot neighborhood structures.
plotneighbors(LondonBoroughs)
plotneighbors(LondonBoroughs, type = "delaunay")
plotneighbors(LondonBoroughs, type = "dist", d1 = 0, d2 = 0.15)



