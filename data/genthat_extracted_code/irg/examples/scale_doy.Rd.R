library(irg)


### Name: scale_doy
### Title: Scale DOY
### Aliases: scale_doy

### ** Examples

# Load data.table
library(data.table)

# Read in example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Scale DOY
scale_doy(ndvi)



