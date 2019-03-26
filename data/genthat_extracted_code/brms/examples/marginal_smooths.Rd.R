library(brms)


### Name: marginal_smooths.brmsfit
### Title: Display Smooth Terms
### Aliases: marginal_smooths.brmsfit marginal_smooths

### ** Examples

## Not run: 
##D set.seed(0) 
##D dat <- mgcv::gamSim(1, n = 200, scale = 2)
##D fit <- brm(y ~ s(x0) + s(x1) + s(x2) + s(x3), data = dat)
##D # show all smooth terms
##D plot(marginal_smooths(fit), rug = TRUE, ask = FALSE)
##D # show only the smooth term s(x2)
##D plot(marginal_smooths(fit, smooths = "s(x2)"), ask = FALSE)
##D 
##D # fit and plot a two-dimensional smooth term
##D fit2 <- brm(y ~ t2(x0, x2), data = dat)
##D ms <- marginal_smooths(fit2)
##D plot(ms, stype = "contour")
##D plot(ms, stype = "raster")
## End(Not run)




