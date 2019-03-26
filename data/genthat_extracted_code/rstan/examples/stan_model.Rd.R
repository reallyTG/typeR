library(rstan)


### Name: stan_model
### Title: Construct a Stan model
### Aliases: stan_model
### Keywords: rstan

### ** Examples
## Not run: 
##D stancode <- 'data {real y_mean;} parameters {real y;} model {y ~ normal(y_mean,1);}'
##D mod <- stan_model(model_code = stancode)
##D fit <- sampling(mod, data = list(y_mean = 0))
##D fit2 <- sampling(mod, data = list(y_mean = 5))
## End(Not run)


