library(vennLasso)


### Name: plotCoefs
### Title: plotting function to investigate estimated coefficients
### Aliases: plotCoefs

### ** Examples

set.seed(123)

dat.sim <- genHierSparseData(ncats = 3, nvars = 25, nobs = 200)

fit <- vennLasso(x = dat.sim$x, y = dat.sim$y, groups = dat.sim$group.ind)

plotCoefs(fit, s = fit$lambda[22])





