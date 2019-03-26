library(rstanarm)


### Name: stan_polr
### Title: Bayesian ordinal regression models via Stan
### Aliases: stan_polr stan_polr.fit

### ** Examples

if (!grepl("^sparc",  R.version$platform)) {
 fit <- stan_polr(tobgp ~ agegp, data = esoph, method = "probit",
          prior = R2(0.2, "mean"), init_r = 0.1, seed = 12345,
          algorithm = "fullrank") # for speed only
 print(fit)
 plot(fit)
}




