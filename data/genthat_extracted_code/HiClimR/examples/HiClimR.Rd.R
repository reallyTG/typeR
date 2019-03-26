library(HiClimR)


### Name: HiClimR
### Title: Hierarchical Climate Regionalization
### Aliases: HiClimR
### Keywords: HiClimR

### ** Examples

require(HiClimR)

#----------------------------------------------------------------------------------#
# Typical use of HiClimR for single-variate clustering:                            #
#----------------------------------------------------------------------------------#

## Load the test data included/loaded in the package (1 degree resolution)
x <- TestCase$x
lon <- TestCase$lon
lat <- TestCase$lat

## Generate/check longitude and latitude mesh vectors for gridded data
xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
lon <- c(xGrid$lon)
lat <- c(xGrid$lat)

## Single-Variate Hierarchical Climate Regionalization
y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE,
    continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE,
    standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL, 
    members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE, 
    validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01, 
    plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)

## For more examples: https://github.com/hsbadr/HiClimR#examples

## Not run: 
##D 
##D #----------------------------------------------------------------------------------#
##D # Additional Examples:                                                             #
##D #----------------------------------------------------------------------------------#
##D 
##D ## Use Ward's method
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE,
##D     continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE,
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL,
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01,
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## Use data splitting for big data
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE,
##D     continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE,
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = TRUE, kH = NULL,
##D     members = NULL, nSplit = 10, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01,
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## Use hybrid Ward-Regional method
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE,
##D     continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE,
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = TRUE, kH = NULL,
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01,
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D ## Check senitivity to kH for the hybrid method above
##D 
##D 
##D #----------------------------------------------------------------------------------#
##D # Typical use of HiClimR for multivariate clustering:                              #
##D #----------------------------------------------------------------------------------#
##D 
##D ## Load the test data included/loaded in the package (1 degree resolution)
##D x1 <- TestCase$x
##D lon <- TestCase$lon
##D lat <- TestCase$lat
##D 
##D ## Generate/check longitude and latitude mesh vectors for gridded data
##D xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
##D lon <- c(xGrid$lon)
##D lat <- c(xGrid$lat)
##D 
##D ## Test if we can replicate single-variate region map with repeated variable
##D y <- HiClimR(x=list(x1, x1), lon = lon, lat = lat, lonStep = 1, latStep = 1, 
##D     geogMask = FALSE, continent = "Africa", meanThresh = list(10, 10), 
##D     varThresh = list(0, 0), detrend = list(TRUE, TRUE), standardize = list(TRUE, TRUE), 
##D     nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL, 
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## Generate a random matrix with the same number of rows
##D x2 <- matrix(rnorm(nrow(x1) * 100, mean=0, sd=1), nrow(x1), 100)
##D 
##D ## Multivariate Hierarchical Climate Regionalization
##D y <- HiClimR(x=list(x1, x2), lon = lon, lat = lat, lonStep = 1, latStep = 1, 
##D     geogMask = FALSE, continent = "Africa", meanThresh = list(10, NULL), 
##D     varThresh = list(0, 0), detrend = list(TRUE, FALSE), standardize = list(TRUE, TRUE), 
##D     weightMVC = list(1, 1), nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL, 
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D ## You can apply all clustering methods and options
##D 
##D #----------------------------------------------------------------------------------#
##D # Miscellaneous examples to provide more information about functionality and usage #
##D # of the helper functions that can be used separately or for other applications.   #
##D #----------------------------------------------------------------------------------#
##D 
##D ## Load test case data
##D x <- TestCase$x
##D 
##D ## Generate longitude and latitude mesh vectors
##D xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
##D lon <- c(xGrid$lon)
##D lat <- c(xGrid$lat)
##D 
##D ## Coarsening spatial resolution
##D xc <- coarseR(x = x, lon = lon, lat = lat, lonStep = 2, latStep = 2)
##D lon <- xc$lon
##D lat <- xc$lat
##D x <- xc$x
##D 
##D ## Use fastCor function to compute the correlation matrix
##D t0 <- proc.time(); xcor <- fastCor(t(x)); proc.time() - t0
##D ## compare with cor function
##D t0 <- proc.time(); xcor0 <- cor(t(x)); proc.time() - t0
##D 
##D ## Check the valid options for geographic masking
##D geogMask()
##D 
##D ## geographic mask for Africa
##D gMask <- geogMask(continent = "Africa", lon = lon, lat = lat, plot = TRUE, 
##D     colPalette = NULL)
##D 
##D ## Hierarchical Climate Regionalization Without geographic masking
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE, 
##D     continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE, 
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL, 
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## With geographic masking (you may specify the mask produced above to save time)
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = TRUE, 
##D     continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE, 
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL, 
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## With geographic masking and contiguity contraint
##D ## Change contigConst as appropriate
##D y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = TRUE,
##D     continent = "Africa", contigConst = 1, meanThresh = 10, varThresh = 0, detrend = TRUE,
##D     standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE, kH = NULL,
##D     members = NULL, nSplit = 1, upperTri = TRUE, verbose = TRUE,
##D     validClimR = TRUE, k = 12, minSize = 1, alpha = 0.01,
##D     plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)
##D 
##D ## Find minimum significant correlation at 95##D 
##D rMin <- minSigCor(n = nrow(x), alpha = 0.05, r = seq(0, 1, by = 1e-06))
##D 
##D ## Validtion of Hierarchical Climate Regionalization
##D z <- validClimR(y, k = 12, minSize = 1, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL)
##D 
##D ## Apply minimum cluster size (minSize = 25)
##D z <- validClimR(y, k = 12, minSize = 25, alpha = 0.01, 
##D     plot = TRUE, colPalette = NULL)
##D 
##D ## The optimal number of clusters, including small clusters
##D k <- length(z$clustFlag)
##D 
##D ## The selected number of clusters, after excluding small clusters (if minSize > 1)
##D ks <- sum(z$clustFlag)
##D 
##D ## Dendrogram plot
##D plot(y, hang = -1, labels = FALSE)
##D 
##D ## Tree cut
##D cutTree <- cutree(y, k = k)
##D table(cutTree)
##D 
##D ## Visualization for gridded data
##D RegionsMap <- matrix(y$region, nrow = length(unique(y$coords[, 1])), byrow = TRUE)
##D colPalette <- colorRampPalette(c("#00007F", "blue", "#007FFF", "cyan", 
##D     "#7FFF7F", "yellow", "#FF7F00", "red", "#7F0000"))
##D image(unique(y$coords[, 1]), unique(y$coords[, 2]), RegionsMap, col = colPalette(ks))
##D 
##D ## Visualization for gridded or ungridded data
##D plot(y$coords[, 1], y$coords[, 2], col = colPalette(max(Regions, na.rm = TRUE))[y$region],
##D     pch = 15, cex = 1)
##D 
##D ## Export region map and mean timeseries into NetCDF-4 file
##D y.nc <- HiClimR2nc(y=y, ncfile="HiClimR.nc", timeunit="years", dataunit="mm")
##D ## The NetCDF-4 file is still open to add other variables or close it
##D nc_close(y.nc)
##D 
## End(Not run)



