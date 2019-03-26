library(freqdom.fda)


### Name: fts.plot.covariance
### Title: Contour plot for the kernels of cross-covariance operators.
### Aliases: fts.plot.covariance
### Keywords: plotting

### ** Examples

fts = fts.rar(100)

# Plot covariance operators of the time series curves
# We chose resolution equal 150 for better precision 
fts.plot.covariance(fts, lags=0:2, res = 150) 

# Plot correlation operators of the time series curves
fts.plot.covariance(fts, lags=0:2, cor = TRUE, res = 50)

# Make the grid of levels more dense
fts.plot.covariance(fts, lags=0:1, nlevels = 100)



