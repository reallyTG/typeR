library(meta4diag)


### Name: meta4diag
### Title: Function to analyse diagnostic meta-analysis with Bayesian
###   methods using INLA.
### Aliases: meta4diag

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   meta4diag(data = Catheter, model.type = 1, var.prior = "invgamma", cor.prior = "normal", 
##D     var.par = c(0.25, 0.025), cor.par = c(0, 5), init = c(0.01, 0.01, 0), 
##D     link = "logit", quantiles = c(0.025, 0.5, 0.975), verbose = FALSE, covariates = NULL, 
##D     nsample = FALSE)
##D }
## End(Not run)



