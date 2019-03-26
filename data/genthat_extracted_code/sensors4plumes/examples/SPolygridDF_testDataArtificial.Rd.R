library(sensors4plumes)


### Name: testDataArtificial
### Title: Small artificial test data
### Aliases: SIndexDF SPointsDF SPixelsDF SPolygridDF SPolygonsDF SLinesDF
### Keywords: datasets

### ** Examples

data(SPolygridDF)

spplot(SPolygridDF, zcol = "b", 
       sp.layout = list("sp.points", SpatialPoints(coordinates(SPolygridDF))))

data(SIndexDF)
spplot(SIndexDF)

data(SLinesDF)
areaSDF(SLinesDF)




