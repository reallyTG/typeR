library(rstanarm)


### Name: stan_glm
### Title: Bayesian generalized linear models via Stan
### Aliases: stan_glm stan_glm.nb stan_glm.fit

### ** Examples

if (!grepl("^sparc",  R.version$platform)) {
### Linear regression
mtcars$mpg10 <- mtcars$mpg / 10
fit <- stan_glm(
  mpg10 ~ wt + cyl + am,            
  data = mtcars, 
  QR = TRUE,
  # for speed of example only (default is "sampling")
  algorithm = "fullrank" 
 ) 
                
plot(fit, prob = 0.5)
plot(fit, prob = 0.5, pars = "beta")
plot(fit, "hist", pars = "sigma")
}
## No test: 
### Logistic regression
head(wells)
wells$dist100 <- wells$dist / 100
fit2 <- stan_glm(
  switch ~ dist100 + arsenic, 
  data = wells, 
  family = binomial(link = "logit"), 
  prior_intercept = normal(0, 10),
  QR = TRUE,
  # for speed of example only
  chains = 2, iter = 200 
)
print(fit2)
prior_summary(fit2)

# ?bayesplot::mcmc_areas
plot(fit2, plotfun = "areas", prob = 0.9,
     pars = c("(Intercept)", "arsenic"))

# ?bayesplot::ppc_error_binned
pp_check(fit2, plotfun = "error_binned") 


### Poisson regression (example from help("glm")) 
count_data <- data.frame(
 counts = c(18,17,15,20,10,20,25,13,12),
 outcome = gl(3,1,9),
 treatment = gl(3,3)
)
fit3 <- stan_glm(
  counts ~ outcome + treatment, 
  data = count_data, 
  family = poisson(link="log"),
  prior = normal(0, 2, autoscale = FALSE),
  # for speed of example only
  chains = 2, iter = 250 
) 
print(fit3)

bayesplot::color_scheme_set("viridis")
plot(fit3)
plot(fit3, regex_pars = c("outcome", "treatment"))
plot(fit3, plotfun = "combo", regex_pars = "treatment") # ?bayesplot::mcmc_combo
posterior_vs_prior(fit3, regex_pars = c("outcome", "treatment"))

### Gamma regression (example from help("glm"))
clotting <- data.frame(log_u = log(c(5,10,15,20,30,40,60,80,100)),
                       lot1 = c(118,58,42,35,27,25,21,19,18),
                       lot2 = c(69,35,26,21,18,16,13,12,12))
fit4 <- stan_glm(
  lot1 ~ log_u, 
  data = clotting, 
  family = Gamma(link="log"),
  iter = 500 # for speed of example only 
 ) 
print(fit4, digits = 2)

fit5 <- update(fit4, formula = lot2 ~ log_u)

# ?bayesplot::ppc_dens_overlay
bayesplot::bayesplot_grid(
  pp_check(fit4, seed = 123), 
  pp_check(fit5, seed = 123),
  titles = c("lot1", "lot2")
) 


### Negative binomial regression
fit6 <- stan_glm.nb(Days ~ Sex/(Age + Eth*Lrn), data = MASS::quine, 
                    link = "log", prior_aux = exponential(1.5),
                    chains = 2, iter = 200) # for speed of example only

prior_summary(fit6)
bayesplot::color_scheme_set("brightblue")
plot(fit6)
pp_check(fit6, plotfun = "hist", nreps = 5) # ?bayesplot::ppc_hist

# 80% interval of estimated reciprocal_dispersion parameter
posterior_interval(fit6, pars = "reciprocal_dispersion", prob = 0.8)
plot(fit6, "areas", pars = "reciprocal_dispersion", prob = 0.8)
## End(No test)




