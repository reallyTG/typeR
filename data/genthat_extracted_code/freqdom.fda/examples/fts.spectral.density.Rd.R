library(freqdom.fda)


### Name: fts.spectral.density
### Title: Functional spectral and cross-spectral density operator
### Aliases: fts.spectral.density
### Keywords: DPCA

### ** Examples

data(pm10)
X = center.fd(pm10)

# Compute the spectral density operator with Bartlett weights
SD = fts.spectral.density(X, freq = (-50:50/50) * pi, q = 2, weight="Bartlett")
fts.plot.operators(SD, freq = -2:2)

# Compute the spectral density operator with Tukey weights
SD = fts.spectral.density(X, freq = (-50:50/50) * pi, q = 2, weight="Tukey")
fts.plot.operators(SD, freq = -2:2)
# Note relatively small difference between the two plots

# Now, compute the spectral density operator with Tukey weights and larger q
SD = fts.spectral.density(X, freq = (-50:50/50) * pi, q = 5, weight="Tukey")
fts.plot.operators(SD, freq = -2:2)



