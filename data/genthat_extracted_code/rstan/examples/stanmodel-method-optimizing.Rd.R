library(rstan)


### Name: optimizing
### Title: Obtain a point estimate by maximizing the joint posterior
### Aliases: optimizing optimizing,stanmodel-method

### ** Examples
## Not run: 
##D m <- stan_model(model_code = 'parameters {real y;} model {y ~ normal(0,1);}')
##D f <- optimizing(m, hessian = TRUE)
## End(Not run)


