library(revdbayes)


### Name: pp_check.evpost
### Title: Posterior predictive checks for an evpost object
### Aliases: pp_check.evpost pp_check

### ** Examples

## Not run: 
##D # GEV model
##D data(portpirie)
##D mat <- diag(c(10000, 10000, 100))
##D pn <- set_prior(prior = "norm", model = "gev", mean = c(0,0,0), cov = mat)
##D gevp  <- rpost(1000, model = "gev", prior = pn, data = portpirie,
##D                nrep = 50)
##D 
##D # Posterior predictive test statistics
##D pp_check(gevp)
##D pp_check(gevp, stat = "min")
##D pp_check(gevp, stat = c("min", "max"))
##D iqr <- function(y) diff(quantile(y, c(0.25, 0.75)))
##D pp_check(gevp, stat = "iqr")
##D 
##D # Overlaid density and distributions functions
##D pp_check(gevp, type = "overlaid")
##D pp_check(gevp, type = "overlaid", subtype = "dens")
##D 
##D # Multiple plots
##D pp_check(gevp, type = "multiple")
##D pp_check(gevp, type = "multiple", subtype = "hist")
##D pp_check(gevp, type = "multiple", subtype = "boxplot")
##D 
##D # Intervals
##D pp_check(gevp, type = "intervals")
##D pp_check(gevp, type = "intervals", subtype = "ribbon")
##D 
##D # User-supplied bayesplot function
##D # Equivalent to p_check(gevp, type = "overlaid")
##D pp_check(gevp, type = "user", fun = "dens_overlay")
##D 
##D # GP model
##D data(gom)
##D u <- quantile(gom, probs = 0.65)
##D fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
##D gpg <- rpost(n = 1000, model = "gp", prior = fp, thresh = u,
##D              data = gom, nrep = 50)
##D pp_check(gpg)
##D pp_check(gpg, type = "overlaid")
##D 
##D # bin-GP model
##D bp <- set_bin_prior(prior = "jeffreys")
##D bgpg <- rpost(n = 1000, model = "bingp", prior = fp, thresh = u,
##D               data = gom, bin_prior = bp, nrep = 50)
##D pp_check(bgpg, stat = "max")
##D 
##D # PP model
##D data(rainfall)
##D rthresh <- 40
##D pf <- set_prior(prior = "flat", model = "gev", min_xi = -1)
##D ppr <- rpost(n = 1000, model = "pp", prior = pf, data = rainfall,
##D              thresh = rthresh, noy = 54, nrep = 50)
##D pp_check(ppr, stat = "max")
## End(Not run)



