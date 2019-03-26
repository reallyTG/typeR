library(rstan)


### Name: vb
### Title: Run Stan's variational algorithm for approximate posterior
###   sampling
### Aliases: vb vb,stanmodel-method

### ** Examples
## Not run: 
##D m <- stan_model(model_code = 'parameters {real y;} model {y ~ normal(0,1);}')
##D f <- vb(m)
## End(Not run)


