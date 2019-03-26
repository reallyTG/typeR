library(chandwich)


### Name: conf_region
### Title: Two-dimensional confidence regions
### Aliases: conf_region

### ** Examples

# -------------------------- GEV model, owtemps data -----------------------
# ------------ following Section 5.2 of Chandler and Bate (2007) -----------

gev_loglik <- function(pars, data) {
  o_pars <- pars[c(1, 3, 5)] + pars[c(2, 4, 6)]
  w_pars <- pars[c(1, 3, 5)] - pars[c(2, 4, 6)]
  if (o_pars[2] <= 0 | w_pars[2] <= 0) return(-Inf)
  o_data <- data[, "Oxford"]
  w_data <- data[, "Worthing"]
  check <- 1 + o_pars[3] * (o_data - o_pars[1]) / o_pars[2]
  if (any(check <= 0)) return(-Inf)
  check <- 1 + w_pars[3] * (w_data - w_pars[1]) / w_pars[2]
  if (any(check <= 0)) return(-Inf)
  o_loglik <- log_gev(o_data, o_pars[1], o_pars[2], o_pars[3])
  w_loglik <- log_gev(w_data, w_pars[1], w_pars[2], w_pars[3])
  return(o_loglik + w_loglik)
}

# Initial estimates (method of moments for the Gumbel case)
sigma <- as.numeric(sqrt(6 * diag(var(owtemps))) / pi)
mu <- as.numeric(colMeans(owtemps) - 0.57722 * sigma)
init <- c(mean(mu), -diff(mu) / 2, mean(sigma), -diff(sigma) / 2, 0, 0)

# Log-likelihood adjustment of the full model
par_names <- c("mu[0]", "mu[1]", "sigma[0]", "sigma[1]", "xi[0]", "xi[1]")
large <- adjust_loglik(gev_loglik, data = owtemps, init = init,
                       par_names = par_names)

## Not run: 
##D # Plots like those in Figure 4 of Chandler and Bate (2007)
##D # (a)
##D which_pars <- c("mu[0]", "mu[1]")
##D reg_1 <- conf_region(large, which_pars = which_pars)
##D reg_none_1 <- conf_region(large, which_pars = which_pars, type = "none")
##D plot(reg_1, reg_none_1)
##D # (b)
##D which_pars <- c("sigma[0]", "sigma[1]")
##D reg_2 <- conf_region(large, which_pars = which_pars)
##D reg_none_2 <- conf_region(large, which_pars = which_pars, type = "none")
##D plot(reg_2, reg_none_2)
##D # (c)
##D # Note: the naive and bivariate model contours are the reversed in the paper
##D which_pars <- c("sigma[0]", "xi[0]")
##D reg_3 <- conf_region(large, which_pars = which_pars)
##D reg_none_3 <- conf_region(large, which_pars = which_pars, type = "none")
##D plot(reg_3, reg_none_3)
## End(Not run)

# --------- Misspecified Poisson model for negative binomial data ----------

# ... following Section 5.1 of the "Object-Oriented Computation of Sandwich
# Estimators" vignette of the sandwich package
# https://cran.r-project.org/web/packages/sandwich/vignettes/sandwich-OOP.pdf

# Simulate data
set.seed(123)
x <- rnorm(250)
y <- rnbinom(250, mu = exp(1 + x), size = 1)
# Fit misspecified Poisson model
fm_pois <- glm(y ~ x + I(x^2), family = poisson)
summary(fm_pois)$coefficients

# Contributions to the independence loglikelihood
pois_glm_loglik <- function(pars, y, x) {
  log_mu <- pars[1] + pars[2] * x + pars[3] * x ^ 2
  return(dpois(y, lambda = exp(log_mu), log = TRUE))
}
pars <- c("alpha", "beta", "gamma")
# Linear model (gamma fixed at 0)
pois_lin <- adjust_loglik(pois_glm_loglik, y = y, x = x, par_names = pars,
                          fixed_pars = "gamma")
pois_vertical <- conf_region(pois_lin)
pois_none <- conf_region(pois_lin, type = "none")
plot(pois_none, pois_vertical, conf = c(50, 75, 95, 99), col = 2:1, lwd = 2,
     lty = 1)



