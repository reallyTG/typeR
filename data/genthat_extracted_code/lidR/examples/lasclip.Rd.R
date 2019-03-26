library(lidR)


### Name: lasclip
### Title: Clip LiDAR points
### Aliases: lasclip lasclipRectangle lasclipPolygon lasclipCircle

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")

# Load the file and clip the region of interest
las = readLAS(LASfile)
subset1 = lasclipRectangle(las, 684850, 5017850, 684900, 5017900)

# Do not load the file(s), extract only the region of interest from a bigger dataset
ctg = catalog(LASfile)
subset2 = lasclipRectangle(ctg, 684850, 5017850, 684900, 5017900)

# Extract all the polygons from a shapefile
shapefile_dir <- system.file("extdata", package = "lidR")
lakes = shapefile(paste0(shapefile_dir, "/lake_polygons_UTM17.shp"))
subset3 = lasclip(ctg, lakes)

# Extract the polygons, write them in files named after the lake names, do not load anything in R
opt_output_files(ctg) <- paste0(tempfile(), "_{LAKENAME_1}")
new_ctg = lasclip(ctg, lakes)

## Not run: 
##D plot(subset1)
##D plot(subset2)
##D plot(subset3)
## End(Not run)



