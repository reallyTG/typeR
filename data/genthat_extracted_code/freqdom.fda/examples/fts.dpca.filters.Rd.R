library(freqdom.fda)


### Name: fts.dpca.filters
### Title: Functional dynamic PCA filters
### Aliases: fts.dpca.filters
### Keywords: DPCA

### ** Examples

data(pm10)
X = center.fd(pm10)

# Compute the spectral density operator with Bartlett weights
SD = fts.spectral.density(X, freq = (-50:50/50) * pi, q = 2, weight="Bartlett")
filters = fts.dpca.filters(SD, 2, q = 10)

# Plot filters 1 and 2
fts.plot.filters(filters, 2, one.plot = TRUE)

# Recompute with a different estimate of the spectral density (largerg q)
SD = fts.spectral.density(X, freq = (-50:50/50) * pi, q = 5, weight="Bartlett")
filters = fts.dpca.filters(SD, 2, q = 10)

# Plot filters 1 and 2
fts.plot.filters(filters, 2, one.plot = TRUE)



