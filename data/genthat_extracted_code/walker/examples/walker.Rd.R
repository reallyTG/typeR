library(walker)


### Name: walker
### Title: Bayesian regression with random walk coefficients
### Aliases: walker

### ** Examples


## note very low number of iterations for the CRAN checks

rw1_fit <- walker(Nile ~ -1 + 
  rw1(~ 1, 
    beta_prior = c(1000, 100), 
    sigma_prior = c(0, 100)), 
  sigma_y_prior = c(0, 100), 
  iter = 200, chains = 1)
  
rw2_fit <- walker(Nile ~ -1 + 
  rw2(~ 1,
    beta_prior = c(1000, 100), 
    sigma_prior = c(0, 100), 
    slope_prior = c(0, 100)), 
  sigma_y_prior = c(0, 100), 
  iter = 200, chains = 1)
  
g_y <- geom_point(data = data.frame(y = Nile, x = time(Nile)), 
  aes(x, y, alpha = 0.5), inherit.aes = FALSE) 
g_rw1 <- plot_coefs(rw1_fit) + g_y
g_rw2 <- plot_coefs(rw2_fit) + g_y
if(require("gridExtra")) {
  grid.arrange(g_rw1, g_rw2, ncol=2, top = "RW1 (left) versus RW2 (right)")
} else {
  g_rw1
  g_rw2
}
## Not run: 
##D y <- window(log10(UKgas), end = time(UKgas)[100])
##D n <- 100
##D cos_t <- cos(2 * pi * 1:n / 4)
##D sin_t <- sin(2 * pi * 1:n / 4)
##D dat <- data.frame(y, cos_t, sin_t)
##D fit <- walker(y ~ -1 + 
##D   rw1(~ cos_t + sin_t, beta_prior = c(0, 10), sigma_prior = c(0, 2)), 
##D   sigma_y_prior = c(0, 10), data = dat, chains = 1, iter = 500)
##D print(fit$stanfit, pars = c("sigma_y", "sigma_rw1"))
##D 
##D plot_coefs(fit)
##D # posterior predictive check:
##D pp_check(fit)
##D 
##D newdata <- data.frame(
##D   cos_t = cos(2 * pi * 101:108 / 4), 
##D   sin_t = sin(2 * pi * 101:108 / 4))
##D pred <- predict(fit, newdata)
##D plot_predict(pred)
## End(Not run)




