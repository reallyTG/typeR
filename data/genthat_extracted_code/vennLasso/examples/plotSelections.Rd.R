library(vennLasso)


### Name: plotSelections
### Title: plotting function to investigate hierarchical structure of
###   selection
### Aliases: plotSelections

### ** Examples

set.seed(123)

dat.sim <- genHierSparseData(ncats = 3, nvars = 25, nobs = 200)

fit <- vennLasso(x = dat.sim$x, y = dat.sim$y, groups = dat.sim$group.ind)

plotSelections(fit, s = fit$lambda[32])





