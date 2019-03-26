library(HiClimR)


### Name: HiClimR2nc
### Title: Export NetCDF-4 file for Hierarchical Climate Regionalization
### Aliases: HiClimR2nc
### Keywords: HiClimR

### ** Examples

require(HiClimR)
require(ncdf4)

## Load test case data
x <- TestCase$x

## Generate longitude and latitude mesh vectors
xGrid <- grid2D(lon = unique(TestCase$lon), lat = unique(TestCase$lat))
lon <- c(xGrid$lon)
lat <- c(xGrid$lat)

## Hierarchical Climate Regionalization
y <- HiClimR(x, lon = lon, lat = lat, lonStep = 1, latStep = 1, geogMask = FALSE,
    continent = "Africa", meanThresh = 10, varThresh = 0, detrend = TRUE,
    standardize = TRUE, nPC = NULL, method = "ward", hybrid = FALSE,
    kH = NULL, members = NULL, validClimR = TRUE, k = 12, minSize = 1,
    alpha = 0.01, plot = TRUE, colPalette = NULL, hang = -1, labels = FALSE)

## Not run: 
##D 
##D ## Export region map and mean timeseries into NetCDF-4 file
##D y.nc <- HiClimR2nc(y=y, ncfile="HiClimR.nc", timeunit="years", dataunit="mm")
##D ## The NetCDF-4 file is still open to add other variables or close it
##D nc_close(y.nc)
##D 
## End(Not run)



