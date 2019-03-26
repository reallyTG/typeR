library(rstan)


### Name: sampling
### Title: Draw samples from a Stan model
### Aliases: sampling sampling,stanmodel-method

### ** Examples
## Not run: 
##D m <- stan_model(model_code = 'parameters {real y;} model {y ~ normal(0,1);}')
##D f <- sampling(m, iter = 100)
## End(Not run)


