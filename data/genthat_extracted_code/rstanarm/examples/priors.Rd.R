library(rstanarm)


### Name: priors
### Title: Prior distributions and options
### Aliases: priors normal student_t cauchy hs hs_plus laplace lasso
###   product_normal exponential decov lkj dirichlet R2

### ** Examples

fmla <- mpg ~ wt + qsec + drat + am

# Draw from prior predictive distribution (by setting prior_PD = TRUE)
prior_pred_fit <- stan_glm(fmla, data = mtcars, prior_PD = TRUE,
                           chains = 1, seed = 12345, iter = 250, # for speed only
                           prior = student_t(df = 4, 0, 2.5), 
                           prior_intercept = cauchy(0,10), 
                           prior_aux = exponential(1/2))
plot(prior_pred_fit, "hist")

## No test: 
# Can assign priors to names
N05 <- normal(0, 5)
fit <- stan_glm(fmla, data = mtcars, prior = N05, prior_intercept = N05)
## End(No test)

# Visually compare normal, student_t, cauchy, laplace, and product_normal
compare_priors <- function(scale = 1, df_t = 2, xlim = c(-10, 10)) {
  dt_loc_scale <- function(x, df, location, scale) { 
    1/scale * dt((x - location)/scale, df)  
  }
  dlaplace <- function(x, location, scale) {
    0.5 / scale * exp(-abs(x - location) / scale)
  }
  dproduct_normal <- function(x, scale) {
    besselK(abs(x) / scale ^ 2, nu = 0) / (scale ^ 2 * pi)
  }
  stat_dist <- function(dist, ...) {
    ggplot2::stat_function(ggplot2::aes_(color = dist), ...)
  }
  ggplot2::ggplot(data.frame(x = xlim), ggplot2::aes(x)) + 
    stat_dist("normal", size = .75, fun = dnorm, 
              args = list(mean = 0, sd = scale)) +
    stat_dist("student_t", size = .75, fun = dt_loc_scale, 
              args = list(df = df_t, location = 0, scale = scale)) +
    stat_dist("cauchy", size = .75, linetype = 2, fun = dcauchy, 
              args = list(location = 0, scale = scale)) + 
    stat_dist("laplace", size = .75, linetype = 2, fun = dlaplace,
              args = list(location = 0, scale = scale)) +
    stat_dist("product_normal", size = .75, linetype = 2, fun = dproduct_normal,
              args = list(scale = 1))            
}
# Cauchy has fattest tails, followed by student_t, laplace, and normal
compare_priors()

# The student_t with df = 1 is the same as the cauchy
compare_priors(df_t = 1) 

# Even a scale of 5 is somewhat large. It gives plausibility to rather 
# extreme values
compare_priors(scale = 5, xlim = c(-20,20)) 

# If you use a prior like normal(0, 1000) to be "non-informative" you are 
# actually saying that a coefficient value of e.g. -500 is quite plausible
compare_priors(scale = 1000, xlim = c(-1000,1000))




