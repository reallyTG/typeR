library(irg)


### Name: model_params
### Title: Estimate model parameters
### Aliases: model_params

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

# Double logistic model parameters
#   given global starting parameters for scalS, scalA
#   and output of model_start for xmidS, xmidA
mods <- model_params(
  ndvi,
  returns = 'models',
  xmidS = 'xmidS_start',
  xmidA = 'xmidA_start',
  scalS = 0.05,
  scalA = 0.01
)



