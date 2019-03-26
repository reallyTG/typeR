library(lidR)


### Name: lasmergespatial
### Title: Merge a point cloud with a source of spatial data
### Aliases: lasmergespatial

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
shp     <- system.file("extdata", "lake_polygons_UTM17.shp", package = "lidR")

las   <- readLAS(LASfile)
lakes <- shapefile(shp)

# The attribute "inlake" does not exist in the shapefile.
# Points are classified as TRUE if in a polygon
las    <- lasmergespatial(las, lakes, "inlakes")     # New attribute 'inlakes' is added.
forest <- lasfilter(las, inlakes == FALSE)
plot(las)
plot(forest)

# The attribute "LAKENAME_1" exists in the shapefile.
# Points are classified with the values of the polygons
las <- lasmergespatial(las, lakes, "LAKENAME_1")     # New column 'LAKENAME_1' is added.



