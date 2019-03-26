library(irg)


### Name: model_ndvi
### Title: Model NDVI time series
### Aliases: model_ndvi

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

## Two options: fit to full year or observed data
# Option 1 - returns = 'models'

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

# Fit to the whole year (requires assignment)
fit <- model_ndvi(mods, observed = FALSE)

# Option 2 - returns = 'columns'
model_params(
  ndvi,
  returns = 'columns',
  xmidS = 'xmidS_start',
  xmidA = 'xmidA_start',
  scalS = 0.05,
  scalA = 0.01
)

# Fit double logistic curve to NDVI time series for the observed days
model_ndvi(ndvi, observed = TRUE)




