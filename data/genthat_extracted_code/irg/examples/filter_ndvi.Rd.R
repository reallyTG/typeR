library(irg)


### Name: filter_ndvi
### Title: Filter NDVI
### Aliases: filter_ndvi

### ** Examples

# Load data.table
library(data.table)

# Read example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Use filter_ndvi to apply all filtering steps (with defaults)
filter_ndvi(ndvi)



