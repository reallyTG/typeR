library(chandwich)


### Name: compare_models
### Title: Comparison of nested models
### Aliases: compare_models

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

# Log-likelihood adjustment of some smaller models: xi[1] = 0 etc

medium <- adjust_loglik(larger = large, fixed_pars = "xi[1]")
small <- adjust_loglik(larger = medium, fixed_pars = c("sigma[1]", "xi[1]"))

# Tests

# Test xi1 = 0 (2 equivalent ways), vertical adjustment
compare_models(large, fixed_pars = "xi[1]")
compare_models(large, medium)
# Test xi1 = 0, using approximation
compare_models(large, medium, approx = TRUE)

# Horizontal adjustments
compare_models(large, medium, type = "cholesky")$p_value
compare_models(large, medium, type = "spectral")$p_value
# No adjustment (independence loglikelihood)
compare_models(large, medium, type = "none")$p_value

# Test sigma1 = 0 for model with xi1 = 0
compare_models(medium, small)
# Test sigma1 = xi1 = 0
compare_models(large, small)

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
pois_quad <- adjust_loglik(pois_glm_loglik, y = y, x = x, par_names = pars)
summary(pois_quad)

pois_lin <- adjust_loglik(larger = pois_quad, fixed_pars = "gamma")

# Test the significance of the quadratic term
compare_models(pois_quad, pois_lin)$p_value
compare_models(pois_quad, pois_lin, approx = TRUE)$p_value



