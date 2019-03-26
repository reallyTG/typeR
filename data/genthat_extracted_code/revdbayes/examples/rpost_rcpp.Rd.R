library(revdbayes)


### Name: rpost_rcpp
### Title: Random sampling from extreme value posterior distributions
### Aliases: rpost_rcpp

### ** Examples

# GP model
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
gpg <- rpost_rcpp(n = 1000, model = "gp", prior = fp, thresh = u,
                  data = gom)
plot(gpg)

# GP model, user-defined prior (same prior as the previous example)
ptr_gp_flat <- create_prior_xptr("gp_flat")
p_user <- set_prior(prior = ptr_gp_flat, model = "gp", min_xi = -1)
gpg <- rpost_rcpp(n = 1000, model = "gp", prior = p_user, thresh = u,
                  data = gom)
plot(gpg)

# Binomial-GP model
u <- quantile(gom, probs = 0.65)
fp <- set_prior(prior = "flat", model = "gp", min_xi = -1)
bp <- set_bin_prior(prior = "jeffreys")
bgpg <- rpost_rcpp(n = 1000, model = "bingp", prior = fp, thresh = u,
  data = gom, bin_prior = bp)
plot(bgpg, pu_only = TRUE)
plot(bgpg, add_pu = TRUE)

# GEV model
mat <- diag(c(10000, 10000, 100))
pn <- set_prior(prior = "norm", model = "gev", mean = c(0, 0, 0), cov = mat)
gevp  <- rpost_rcpp(n = 1000, model = "gev", prior = pn, data = portpirie)
plot(gevp)

# GEV model, user-defined prior (same prior as the previous example)
mat <- diag(c(10000, 10000, 100))
ptr_gev_norm <- create_prior_xptr("gev_norm")
pn_u <- set_prior(prior = ptr_gev_norm, model = "gev", mean = c(0, 0, 0),
                  icov = solve(mat))
gevu <- rpost_rcpp(n = 1000, model = "gev", prior = pn_u, data = portpirie)
plot(gevu)

# GEV model, informative prior constructed on the probability scale
pip  <- set_prior(quant = c(85, 88, 95), alpha = c(4, 2.5, 2.25, 0.25),
  model = "gev", prior = "prob")
ox_post <- rpost_rcpp(n = 1000, model = "gev", prior = pip, data = oxford)
plot(ox_post)

# PP model
pf <- set_prior(prior = "flat", model = "gev", min_xi = -1)
ppr <- rpost_rcpp(n = 1000, model = "pp", prior = pf, data = rainfall,
                  thresh = 40, noy = 54)
plot(ppr)

# PP model, user-defined prior (same prior as the previous example)
ptr_gev_flat <- create_prior_xptr("gev_flat")
pf_u <- set_prior(prior = ptr_gev_flat, model = "gev", min_xi = -1,
                  max_xi = Inf)
ppru <- rpost_rcpp(n = 1000, model = "pp", prior = pf_u, data = rainfall,
                   thresh = 40, noy = 54)
plot(ppru)

# PP model, informative prior constructed on the quantile scale
piq <- set_prior(prob = 10^-(1:3), shape = c(38.9, 7.1, 47),
                 scale = c(1.5, 6.3, 2.6), model = "gev", prior = "quant")
rn_post <- rpost_rcpp(n = 1000, model = "pp", prior = piq, data = rainfall,
                      thresh = 40, noy = 54)
plot(rn_post)

# OS model
mat <- diag(c(10000, 10000, 100))
pv <- set_prior(prior = "norm", model = "gev", mean = c(0, 0, 0), cov = mat)
osv <- rpost_rcpp(n = 1000, model = "os", prior = pv, data = venice)
plot(osv)



