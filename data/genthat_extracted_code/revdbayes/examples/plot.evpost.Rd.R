library(revdbayes)


### Name: plot.evpost
### Title: Plot diagnostics for an evpost object
### Aliases: plot.evpost

### ** Examples

## GP posterior
data(gom)
u <- stats::quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
gpg <- rpost(n = 1000, model = "gp", prior = fp, thresh = u, data = gom)
plot(gpg)

## Not run: 
##D # Using the bayesplot package
##D plot(gpg, use_bayesplot = TRUE)
##D plot(gpg, use_bayesplot = TRUE, pars = "xi", prob = 0.95)
##D plot(gpg, use_bayesplot = TRUE, fun_name = "intervals", pars = "xi")
##D plot(gpg, use_bayesplot = TRUE, fun_name = "hist")
##D plot(gpg, use_bayesplot = TRUE, fun_name = "dens")
##D plot(gpg, use_bayesplot = TRUE, fun_name = "scatter")
## End(Not run)

## bin-GP posterior
data(gom)
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
bp <- set_bin_prior(prior = "jeffreys")
npy_gom <- length(gom)/105
bgpg <- rpost(n = 1000, model = "bingp", prior = fp, thresh = u,
              data = gom, bin_prior = bp, npy = npy_gom)
plot(bgpg)
plot(bgpg, pu_only = TRUE)
plot(bgpg, add_pu = TRUE)

## Not run: 
##D # Using the bayesplot package
##D dimnames(bgpg$bin_sim_vals)
##D plot(bgpg, use_bayesplot = TRUE)
##D plot(bgpg, use_bayesplot = TRUE, fun_name = "hist")
##D plot(bgpg, use_bayesplot = TRUE, pars = "p[u]")
## End(Not run)



