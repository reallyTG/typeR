library(revdbayes)


### Name: rpost
### Title: Random sampling from extreme value posterior distributions
### Aliases: rpost

### ** Examples

## Not run: 
##D # GP model
##D u <- quantile(gom, probs = 0.65)
##D fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
##D gpg <- rpost(n = 1000, model = "gp", prior = fp, thresh = u, data = gom)
##D plot(gpg)
##D 
##D # Binomial-GP model
##D u <- quantile(gom, probs = 0.65)
##D fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
##D bp <- set_bin_prior(prior = "jeffreys")
##D bgpg <- rpost(n = 1000, model = "bingp", prior = fp, thresh = u, data = gom,
##D               bin_prior = bp)
##D plot(bgpg, pu_only = TRUE)
##D plot(bgpg, add_pu = TRUE)
##D 
##D # GEV model
##D mat <- diag(c(10000, 10000, 100))
##D pn <- set_prior(prior = "norm", model = "gev", mean = c(0, 0, 0), cov = mat)
##D gevp  <- rpost(n = 1000, model = "gev", prior = pn, data = portpirie)
##D plot(gevp)
##D 
##D # GEV model, informative prior constructed on the probability scale
##D pip  <- set_prior(quant = c(85, 88, 95), alpha = c(4, 2.5, 2.25, 0.25),
##D                   model = "gev", prior = "prob")
##D ox_post <- rpost(n = 1000, model = "gev", prior = pip, data = oxford)
##D plot(ox_post)
##D 
##D # PP model
##D pf <- set_prior(prior = "flat", model = "gev", min_xi = -1)
##D ppr <- rpost(n = 1000, model = "pp", prior = pf, data = rainfall,
##D              thresh = 40, noy = 54)
##D plot(ppr)
##D 
##D # PP model, informative prior constructed on the quantile scale
##D piq <- set_prior(prob = 10^-(1:3), shape = c(38.9, 7.1, 47),
##D                  scale = c(1.5, 6.3, 2.6), model = "gev", prior = "quant")
##D rn_post <- rpost(n = 1000, model = "pp", prior = piq, data = rainfall,
##D                  thresh = 40, noy = 54)
##D plot(rn_post)
##D 
##D # OS model
##D mat <- diag(c(10000, 10000, 100))
##D pv <- set_prior(prior = "norm", model = "gev", mean = c(0, 0, 0), cov = mat)
##D osv <- rpost(n = 1000, model = "os", prior = pv, data = venice)
##D plot(osv)
## End(Not run)



