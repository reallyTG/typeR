library(rstanarm)


### Name: pairs.stanreg
### Title: Pairs method for stanreg objects
### Aliases: pairs.stanreg pairs_style_np pairs_condition

### ** Examples

## No test: 
if (!exists("example_model")) example(example_model)

bayesplot::color_scheme_set("purple")

# see 'condition' argument above for details on the plots below and 
# above the diagonal. default is to split by accept_stat__.
pairs(example_model, pars = c("(Intercept)", "log-posterior"))

pairs(
  example_model, 
  regex_pars = "herd:[2,7,9]", 
  diag_fun = "dens",
  off_diag_fun = "hex"
)
## End(No test)

## No test: 
# for demonstration purposes, intentionally fit a model that
# will (almost certainly) have some divergences
fit <- stan_glm(
  mpg ~ ., data = mtcars,
  iter = 1000,
  # this combo of prior and adapt_delta should lead to some divergences
  prior = hs(),
  adapt_delta = 0.9
)

pairs(fit, pars = c("wt", "sigma", "log-posterior"))

pairs(
  fit, 
  pars = c("wt", "sigma", "log-posterior"), 
  transformations = list(sigma = "log"), # show log(sigma) instead of sigma
  off_diag_fun = "hex" # use hexagonal heatmaps instead of scatterplots
)


bayesplot::color_scheme_set("brightblue")
pairs(
  fit, 
  pars = c("(Intercept)", "wt", "sigma", "log-posterior"), 
  transformations = list(sigma = "log"), 
  off_diag_args = list(size = 3/4, alpha = 1/3), # size and transparency of scatterplot points
  np_style = pairs_style_np(div_color = "black", div_shape = 2) # color and shape of the divergences
)

# Using the condition argument to show divergences above the diagonal 
pairs(
  fit, 
  pars = c("(Intercept)", "wt", "log-posterior"), 
  condition = pairs_condition(nuts = "divergent__")
)

## End(No test)




