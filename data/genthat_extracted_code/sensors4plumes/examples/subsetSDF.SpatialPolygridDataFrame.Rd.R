library(sensors4plumes)


### Name: subsetSDF.SpatialPolygridDataFrame
### Title: Subsetting objects of class SpatialPolygridDataFrame
### Aliases: subsetSDF.SpatialPolygridDataFrame
###   subsetSDF,SpatialPolygridDataFrame-method

### ** Examples

data(SPolygridDF)
# subset only attributes
SPolygridDF1 = subsetSDF(SPolygridDF, data = 2)
# subset by locations
SPolygridDF2 = subsetSDF(SPolygridDF, locations = c(1,3,5,7))
# subset by rows and columns of the grid
SPolygridDF3 = subsetSDF(SPolygridDF, grid_i = 3:4, grid_j = 3:9)
# subset by individual grid cells
Grid_ij = matrix(nrow = 6, ncol = 6, byrow = TRUE, data = c(
                         TRUE, FALSE, FALSE, FALSE, FALSE, TRUE,
                        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE,
                        FALSE, FALSE,  TRUE,  TRUE, FALSE, FALSE,
                        FALSE, FALSE,  TRUE,  TRUE, FALSE, FALSE,
                         TRUE, FALSE, FALSE, FALSE, FALSE, TRUE,
                        FALSE, FALSE, FALSE, FALSE, FALSE, FALSE))
SPolygridDF4 = subsetSDF(SPolygridDF, grid_ij = Grid_ij)
# subset by bounding box of coordinates
SPolygridDF5 = subsetSDF(SPolygridDF, coord_x = c(3,11), coord_y = c(3,11))

# combined subset (overlap of all subsetting parameters), result has 1 cell
SPolygridDF6 = subsetSDF(SPolygridDF, 
data = "a", locations = 4:1, coord_x = c(0,6), grid_i = 1:3)



