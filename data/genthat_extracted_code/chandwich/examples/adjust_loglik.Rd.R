library(chandwich)


### Name: adjust_loglik
### Title: Loglikelihood adjustment using the sandwich estimator
### Aliases: adjust_loglik

### ** Examples

# ------------------------- Binomial model, rats data ----------------------

# Contributions to the independence loglikelihood
binom_loglik <- function(prob, data) {
  if (prob < 0 || prob > 1) {
    return(-Inf)
  }
  return(dbinom(data[, "y"], data[, "n"], prob, log = TRUE))
}
rat_res <- adjust_loglik(loglik = binom_loglik, data = rats, par_names = "p")

# Plot the loglikelihoods
plot(rat_res, type = 1:4, legend_pos = "bottom", lwd = 2, col = 1:4)
# MLE, SEs and adjusted SEs
summary(rat_res)

# -------------------------- GEV model, owtemps data -----------------------
# ------------ following Section 5.2 of Chandler and Bate (2007) -----------

# Contributions to the independence loglikelihood
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

# Loglikelihood adjustment for the full model
par_names <- c("mu[0]", "mu[1]", "sigma[0]", "sigma[1]", "xi[0]", "xi[1]")
large <- adjust_loglik(gev_loglik, data = owtemps, init = init,
                       par_names = par_names)
# Rows 1, 3 and 4 of Table 2 of Chandler and Bate (2007)
t(summary(large))

# Loglikelihood adjustment of some smaller models: xi[1] = 0 etc

# Starting from a larger model
medium <- adjust_loglik(larger = large, fixed_pars = "xi[1]")
small <- adjust_loglik(larger = large, fixed_pars = c("sigma[1]", "xi[1]"))
small <- adjust_loglik(larger = medium, fixed_pars = c("sigma[1]", "xi[1]"))

# Starting from scratch
medium <- adjust_loglik(gev_loglik, data = owtemps, init = init,
          par_names = par_names, fixed_pars = "xi[1]")
small <- adjust_loglik(gev_loglik, data = owtemps, init = init,
         par_names = par_names, fixed_pars = c("sigma[1]", "xi[1]"))

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

# Providing algebraic derivatives and Hessian
pois_alg_deriv <- function(pars, y, x) {
  mu <- exp(pars[1] + pars[2] * x + pars[3] * x ^ 2)
  return(cbind(y - mu, x * (y - mu), x ^2 * (y - mu)))
}
pois_alg_hess <- function(pars, y, x) {
  mu <- exp(pars[1] + pars[2] * x + pars[3] * x ^ 2)
  alg_hess <- matrix(0, 3, 3)
  alg_hess[1, ] <- -c(sum(mu), sum(x * mu), sum(x ^ 2 * mu))
  alg_hess[2, ] <- -c(sum(x * mu), sum(x ^ 2 * mu), sum(x ^ 3 * mu))
  alg_hess[3, ] <- -c(sum(x ^ 2 * mu), sum(x ^ 3 * mu), sum(x ^ 4 * mu))
  return(alg_hess)
}
pois_quad <- adjust_loglik(pois_glm_loglik, y = y, x = x, p = 3,
                           alg_deriv = pois_alg_deriv, alg_hess = pois_alg_hess)
summary(pois_quad)

got_sandwich <- requireNamespace("sandwich", quietly = TRUE)
if (got_sandwich) {
  # Providing MLE, H and V
  # H and V calculated using bread() and meat() from sandwich package
  n_obs <- stats::nobs(fm_pois)
  pois_quad <- adjust_loglik(pois_glm_loglik, y = y, x = x, p = 3,
                             mle = fm_pois$coefficients,
                             H = -solve(sandwich::bread(fm_pois) / n_obs),
                             V = sandwich::meat(fm_pois) * n_obs)
}



