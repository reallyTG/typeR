library(freqdom.fda)


### Name: fts.cov.structure
### Title: Estimate autocovariance and cross-covariances operators
### Aliases: fts.cov.structure
### Keywords: time-domain

### ** Examples

# Generate an autoregressive process
fts = fts.rar(d=3)

# Get covariance at lag 0
fts.cov.structure(fts, lags = 0)

# Get covariance at lag 10
fts.cov.structure(fts, lags = 10)

# Get entire covariance structure between -20 and 20
fts.cov.structure(fts, lags = -20:20)

# Compute covariance with another process
fts0 = fts + fts.rma(d=3)
fts.cov.structure(fts, fts0, lags = -2:2)



