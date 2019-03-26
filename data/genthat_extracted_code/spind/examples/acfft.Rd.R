library(spind)


### Name: acfft
### Title: Spatial autocorrelation diagnostics
### Aliases: acfft

### ** Examples

data(musdata)
coords <- musdata[ ,4:5]
mglm <- glm(musculus ~ pollution + exposure, "poisson", musdata)

ac <- acfft(coords, resid(mglm, type = "pearson"), lim1 = 0, lim2 = 1)
ac




