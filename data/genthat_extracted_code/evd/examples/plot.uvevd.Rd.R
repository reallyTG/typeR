library(evd)


### Name: plot.uvevd
### Title: Plot Diagnostics for a Univariate EVD Object
### Aliases: plot.uvevd
### Keywords: hplot

### ** Examples

uvdata <- rgev(100, loc = 0.13, scale = 1.1, shape = 0.2)
M1 <- fgev(uvdata)
## Not run: par(mfrow = c(2,2))
## Not run: plot(M1)

uvdata <- rgpd(100, loc = 0, scale = 1.1, shape = 0.2)
M1 <- fpot(uvdata, 1)
## Not run: par(mfrow = c(2,2))
## Not run: plot(M1)



