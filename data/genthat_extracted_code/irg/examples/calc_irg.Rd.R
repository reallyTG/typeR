library(irg)


### Name: calc_irg
### Title: IRG
### Aliases: calc_irg

### ** Examples

# Load data.table
library(data.table)

# Read in example data
ndvi <- fread(system.file("extdata", "ndvi.csv", package = "irg"))

# Filter and scale NDVI time series
filter_ndvi(ndvi)
scale_doy(ndvi)
scale_ndvi(ndvi)

# Guess starting parameters
model_start(ndvi)

# Double logistic model parameters given starting parameters for nls
mods <- model_params(
  ndvi,
  return = 'models',
  xmidS = 'xmidS_start',
  xmidA = 'xmidA_start',
  scalS = 0.05,
  scalA = 0.01
)

# Fit double logistic curve to NDVI time series
fit <- model_ndvi(mods, observed = FALSE)

# Calculate IRG for each day of the year
calc_irg(fit)



