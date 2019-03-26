library(glacierSMBM)


### Name: extractRasterValues
### Title: Function: Extract raster values
### Aliases: extractRasterValues
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load the provided data set and RasterLayer as exemplary
# input for the function
data(selectedCoordinates, lst_30m_hourly,
    package = "glacierSMBM")
# Individual data sets should be loaded using the
# functions read.*() or raster(), respectively

# Extract the requested cell values of a RasterLayer based
# on the given coordinates
output <- extractRasterValues(rasterLayer = lst_30m_hourly,
    selectedCoordinates = selectedCoordinates)



