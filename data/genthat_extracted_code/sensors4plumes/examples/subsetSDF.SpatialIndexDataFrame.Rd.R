library(sensors4plumes)


### Name: subsetSDF.SpatialIndexDataFrame
### Title: Subsetting objects of class SpatialIndexDataFrame
### Aliases: subsetSDF.SpatialIndexDataFrame
###   subsetSDF,SpatialIndexDataFrame-method

### ** Examples

data(SIndexDF)
# subset
SIndexDF1 = subsetSDF(SIndexDF, grid = which(SIndexDF@index == 1)) 
SIndexDF2 = subsetSDF(SIndexDF, locations = 1) # identical to x_1
SIndexDF3 = subsetSDF(SIndexDF, grid = c(2:4, 6:8, 10:12, 14:16, 18:20), data = "c")



