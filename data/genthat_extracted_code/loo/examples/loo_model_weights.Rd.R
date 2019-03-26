library(loo)


### Name: loo_model_weights
### Title: Model averaging/weighting via stacking or pseudo-BMA weighting
### Aliases: loo_model_weights loo_model_weights.default stacking_weights
###   pseudobma_weights

### ** Examples

## Not run: 
##D ### Demonstrating usage after fitting models with RStan
##D library(rstan)
##D 
##D # generate fake data from N(0,1).
##D N <- 100
##D y <- rnorm(N, 0, 1)
##D 
##D # Suppose we have three models: N(-1, sigma), N(0.5, sigma) and N(0.6,sigma).
##D stan_code <- "
##D   data {
##D     int N;
##D     vector[N] y;
##D     real mu_fixed;
##D   }
##D   parameters {
##D     real<lower=0> sigma;
##D   }
##D   model {
##D     sigma ~ exponential(1);
##D     y ~ normal(mu_fixed, sigma);
##D   }
##D   generated quantities {
##D     vector[N] log_lik;
##D     for (n in 1:N) log_lik[n] = normal_lpdf(y[n]| mu_fixed, sigma);
##D   }"
##D 
##D mod <- stan_model(model_code = stan_code)
##D fit1 <- sampling(mod, data=list(N=N, y=y, mu_fixed=-1))
##D fit2 <- sampling(mod, data=list(N=N, y=y, mu_fixed=0.5))
##D fit3 <- sampling(mod, data=list(N=N, y=y, mu_fixed=0.6))
##D model_list <- list(fit1, fit2, fit3)
##D log_lik_list <- lapply(model_list, extract_log_lik)
##D 
##D # optional but recommended
##D r_eff_list <- lapply(model_list, function(x) {
##D   ll_array <- extract_log_lik(x, merge_chains = FALSE)
##D   relative_eff(exp(ll_array))
##D })
##D 
##D # stacking method:
##D wts1 <- loo_model_weights(
##D   log_lik_list,
##D   method = "stacking",
##D   r_eff_list = r_eff_list,
##D   optim_control = list(reltol=1e-10)
##D )
##D print(wts1)
##D 
##D # can also pass a list of psis_loo objects to avoid recomputing loo
##D loo_list <- lapply(1:length(log_lik_list), function(j) {
##D   loo(log_lik_list[[j]], r_eff = r_eff_list[[j]])
##D })
##D 
##D wts2 <- loo_model_weights(
##D   loo_list,
##D   method = "stacking",
##D   optim_control = list(reltol=1e-10)
##D )
##D all.equal(wts1, wts2)
##D 
##D 
##D # pseudo-BMA+ method:
##D set.seed(1414)
##D loo_model_weights(loo_list, method = "pseudobma")
##D 
##D # pseudo-BMA method (set BB = FALSE):
##D loo_model_weights(loo_list, method = "pseudobma", BB = FALSE)
##D 
##D # calling stacking_weights or pseudobma_weights directly
##D lpd1 <- loo(log_lik_list[[1]], r_eff = r_eff_list[[1]])$pointwise[,1]
##D lpd2 <- loo(log_lik_list[[2]], r_eff = r_eff_list[[2]])$pointwise[,1]
##D lpd3 <- loo(log_lik_list[[3]], r_eff = r_eff_list[[3]])$pointwise[,1]
##D stacking_weights(cbind(lpd1, lpd2, lpd3))
##D pseudobma_weights(cbind(lpd1, lpd2, lpd3))
##D pseudobma_weights(cbind(lpd1, lpd2, lpd3), BB = FALSE)
## End(Not run)




