library(bayesplot)


### Name: MCMC-intervals
### Title: Plot interval estimates from MCMC draws
### Aliases: MCMC-intervals mcmc_intervals mcmc_areas mcmc_areas_ridges
###   mcmc_intervals_data mcmc_areas_data mcmc_areas_ridges_data

### ** Examples

set.seed(9262017)
# some parameter draws to use for demonstration
x <- example_mcmc_draws(params = 6)
dim(x)
dimnames(x)

color_scheme_set("brightblue")
mcmc_intervals(x)
mcmc_intervals(x, pars = c("beta[1]", "beta[2]"))
mcmc_areas(x, regex_pars = "beta\\[[1-3]", prob = 0.8) +
 ggplot2::labs(
   title = "Posterior distributions",
   subtitle = "with medians and 80% intervals"
 )

color_scheme_set("red")
mcmc_areas(
   x,
   pars = c("alpha", "beta[4]"),
   prob = 2/3,
   prob_outer = 0.9,
   point_est = "mean"
)

# color by rhat value
color_scheme_set("blue")
fake_rhat_values <- c(1, 1.07, 1.3, 1.01, 1.15, 1.005)
mcmc_intervals(x, rhat = fake_rhat_values)

mcmc_intervals_data(x)
mcmc_intervals_data(x, rhat = fake_rhat_values)
mcmc_areas_data(x, pars = "alpha")

color_scheme_set("gray")
p <- mcmc_areas(x, pars = c("alpha", "beta[4]"), rhat = c(1, 1.1))
p + legend_move("bottom")
p + legend_move("none") # or p + legend_none()

## No test: 
# apply transformations
mcmc_intervals(
  x,
  pars = c("beta[2]", "sigma"),
  transformations = list("sigma" = "log", "beta[2]" = function(x) x + 3)
)

# apply same transformation to all selected parameters
mcmc_intervals(x, regex_pars = "beta", transformations = "exp")
## End(No test)

## Not run: 
##D # example using fitted model from rstanarm package
##D library(rstanarm)
##D fit <- stan_glm(
##D  mpg ~ 0 + wt + factor(cyl),
##D  data = mtcars,
##D  iter = 500
##D )
##D x <- as.matrix(fit)
##D 
##D color_scheme_set("teal")
##D mcmc_intervals(x, point_est = "mean", prob = 0.8, prob_outer = 0.95)
##D mcmc_areas(x, regex_pars = "cyl", bw = "SJ",
##D            rhat = rhat(fit, regex_pars = "cyl"))
## End(Not run)

## Not run: 
##D # Example of hierarchically related parameters
##D # plotted with ridgelines
##D m <- shinystan::eight_schools@posterior_sample
##D mcmc_areas_ridges(m, pars = "mu", regex_pars = "theta") +
##D  ggplot2::ggtitle("Treatment effect on eight schools (Rubin, 1981)")
## End(Not run)




