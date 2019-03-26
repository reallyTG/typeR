library(sensors4plumes)


### Name: subsetSDF
### Title: Subsetting objects of class SpatialDataFrame
### Aliases: subsetSDF subsetSDF.SpatialPointsDataFrame
###   subsetSDF,SpatialPointsDataFrame-method
###   subsetSDF.SpatialPixelsDataFrame
###   subsetSDF,SpatialPixelsDataFrame-method
###   subsetSDF.SpatialPolygonsDataFrame
###   subsetSDF,SpatialPolygonsDataFrame-method
###   subsetSDF.SpatialLinesDataFrame
###   subsetSDF,SpatialLinesDataFrame-method

### ** Examples

data(SIndexDF)
data(SPointsDF)
data(SPixelsDF)
data(SPolygridDF)
data(SPolygonsDF)
data(SLinesDF)

sub_Index = subsetSDF(SIndexDF, locations = c(1,3), data = "c")
sub_Points = subsetSDF(SPointsDF, locations = c(1,3), data = "z")
sub_Pixels = subsetSDF(SPixelsDF, locations = c(1,3), data = "z")
sub_Polygrid = subsetSDF(SPolygridDF, locations = c(1,3), data = "b")
sub_Polygons = subsetSDF(SPolygonsDF, locations = c(1,3), data = "a")
sub_Lines = subsetSDF(SLinesDF, locations = 1:2, data = "a")




