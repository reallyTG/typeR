library(rstan)


### Name: loo.stanfit
### Title: Approximate leave-one-out cross-validation
### Aliases: loo.stanfit loo,stanfit-method loo

### ** Examples

## Not run: 
##D # Generate a dataset from N(0,1)
##D N <- 100
##D y <- rnorm(N, 0, 1)
##D 
##D # Suppose we have three models for y: 
##D #  1) y ~ N(-1, sigma) 
##D #  2) y ~ N(0.5, sigma)
##D #  3) y ~ N(0.6,sigma)
##D # 
##D stan_code <- "
##D data {
##D   int N;
##D   vector[N] y;
##D   real mu_fixed;
##D }
##D   parameters {
##D   real<lower=0> sigma;
##D }
##D model { 
##D   sigma ~ exponential(1);
##D   y ~ normal(mu_fixed, sigma);
##D }
##D generated quantities {
##D   vector[N] log_lik;
##D   for (n in 1:N) log_lik[n] = normal_lpdf(y[n]| mu_fixed, sigma);
##D }"
##D 
##D mod <- stan_model(model_code = stan_code)
##D fit1 <- sampling(mod, data=list(N=N, y=y, mu_fixed=-1))
##D fit2 <- sampling(mod, data=list(N=N, y=y, mu_fixed=0.5))
##D fit3 <- sampling(mod, data=list(N=N, y=y, mu_fixed=0.6))
##D 
##D # use the loo method for stanfit objects
##D loo1 <- loo(fit1, pars = "log_lik")
##D print(loo1)
##D 
##D # which is equivalent to 
##D LL <- as.array(fit1, pars = "log_lik")
##D r_eff <- loo::relative_eff(exp(LL))
##D loo1b <- loo::loo.array(LL, r_eff = r_eff)
##D print(loo1b)
##D 
##D # compute loo for the other models
##D loo2 <- loo(fit2)
##D loo3 <- loo(fit3)
##D 
##D # stacking weights
##D wts <- loo::loo_model_weights(list(loo1, loo2, loo3), method = "stacking")
##D print(wts)
## End(Not run)



