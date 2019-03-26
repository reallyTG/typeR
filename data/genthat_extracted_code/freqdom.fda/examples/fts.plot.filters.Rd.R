library(freqdom.fda)


### Name: fts.plot.filters
### Title: Plot kernels
### Aliases: fts.plot.filters
### Keywords: plotting

### ** Examples

# Load example PM10 data from Graz, Austria
data(pm10) # loads functional time series pm10 to the environment
X = center.fd(pm10)

# Compute functional dynamic principal components with only one component
res.dpca = fts.dpca(X, Ndpc = 1, freq=(-25:25/25)*pi) # leave default freq for higher precision

# Plot Functional Dynamic Principal Component Filters
fts.plot.filters(res.dpca$filters)



