library(irg)


### Name: scale_ndvi
### Title: Scale NDVI
### Aliases: scale_ndvi

### ** Examples

# Load data.table
library(data.table)

# Read in example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Filter and scale NDVI time series
filter_ndvi(ndvi)
scale_ndvi(ndvi)



