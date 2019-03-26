library(ggfan)


### Name: gp_model_fit
### Title: A 'stan_fit' object used in the 'ggfan_stan' vignette,
###   containing posterior samples from a latent gaussian process model.
###   This is provided as data to avoid having to conduct computationally
###   expensive sampling when producing the vignettes.
### Aliases: gp_model_fit
### Keywords: datasets

### ** Examples

## Not run: 
##D # generate mean and variance for sequence of samples over time
##D library(rstan)
##D library(dplyr)
##D library(magrittr)
##D library(tidyr)
##D library(tibble)
##D 
##D library(ggfan)
##D seed <- 34526
##D set.seed(seed)
##D 
##D # data 
##D x <- seq(-5,5,0.1)
##D N <- length(x)
##D y <- cbind(rpois(N, exp(sin(x)+2)),rpois(N, exp(sin(x)+2)))
##D 
##D stan_data <- list(N=N, x=x, y=y)
##D 
##D 
##D compiled_model <- stan_model(file=file.path(path.package("ggfan"), 
##D                                             "stan","latent_gp_pois.stan"))
##D gp_model_fit <- sampling(compiled_model, data=stan_data, iter=3000,thin=6)
##D #devtools::use_data(gp_model_fit, internal=FALSE)
## End(Not run)



