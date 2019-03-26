library(IsoriX)


### Name: ElevRasterDE
### Title: The raster of elevation for Germany
### Aliases: ElevRasterDE
### Keywords: datasets

### ** Examples


## The following example require to download
## a large elevation raster with the function getelev()
## and will therefore not run unless you uncomment it

#### Creating the object ElevRasterDE
#
### Download the tif file (ca. 700 Mb)
### (see ?getelev for details on how to get the tif file)
#getelev()
#
### Convert the tif into R raster format
#  ElevationRasterBig <- raster("gmted2010_30mn.tif")
#  
#  ## Create the highly agregated elevation raster
#  ElevRasterDE <- prepraster(ElevationRasterBig,
#                             aggregation_factor = 10,
#                             manual_crop = c(5.5, 15.5, 47, 55.5))
#                           
#  ## Plot the elevation
#  levelplot(ElevRasterDE, margin = FALSE, par.settings=RdBuTheme()) +
#    layer(sp.polygons(CountryBorders, col = "white"))
#  
#  ## Compute crudely the resolution:
#  median(values(area(ElevRasterDE)))  ## approximative size of cells in km2




