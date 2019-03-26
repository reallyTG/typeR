library(pseval)


### Name: add_bootstrap
### Title: Bootstrap resampling parameters
### Aliases: add_bootstrap

### ** Examples

## Not run: 
##D test <- psdesign(generate_example_data(n = 100), Z = Z, Y = Y.obs, S = S.obs, BIP = BIP)
##D est1 <- test + integrate_parametric(S.1 ~ BIP) + risk_binary() + ps_estimate(method = "BFGS")
##D est1 + ps_bootstrap(method = "BFGS", start = est1$estimates$par, n.boots = 50)
## End(Not run)



