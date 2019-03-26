library(irg)


### Name: model_start
### Title: Model starting parameters
### Aliases: model_start

### ** Examples

# Load data.table
library(data.table)

# Read in example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Filter and scale NDVI time series
filter_ndvi(ndvi)
scale_doy(ndvi)
scale_ndvi(ndvi)

# Guess starting parameters for xmidS and xmidA
model_start(ndvi)



