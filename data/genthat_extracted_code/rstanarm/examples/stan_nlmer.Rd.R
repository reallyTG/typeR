library(rstanarm)


### Name: stan_nlmer
### Title: Bayesian nonlinear models with group-specific terms via Stan
### Aliases: stan_nlmer

### ** Examples

## No test: 
data("Orange", package = "datasets")
Orange$circumference <- Orange$circumference / 100
Orange$age <- Orange$age / 100
fit <- stan_nlmer(
  circumference ~ SSlogis(age, Asym, xmid, scal) ~ Asym|Tree, 
  data = Orange, 
  # for speed only
  chains = 1, 
  iter = 1000
 ) 
print(fit)
posterior_interval(fit)
plot(fit, regex_pars = "b\\[")
## End(No test)



