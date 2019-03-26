library(freqdom.fda)


### Name: fts.plot.operators
### Title: Contour plot of operator kernels.
### Aliases: fts.plot.operators
### Keywords: plotting

### ** Examples

# Load example PM10 data from Graz, Austria
data(pm10) # loads functional time series pm10 to the environment
X = center.fd(pm10)

# Compute functional dynamic principal components with only one component
res.dpca = fts.dpca(X, Ndpc = 1, freq=(-25:25/25)*pi) # leave default freq for higher precision

# Plot the spectral density operator at frequencies -2, -3:3/30 * pi and 2
fts.plot.operators(res.dpca$spec.density,freq = c(-2,-3:3/30 * pi,2))



