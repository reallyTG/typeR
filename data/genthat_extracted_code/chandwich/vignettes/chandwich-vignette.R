## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ---- fig.align='center', fig.width=7, fig.height=5----------------------
library(chandwich)
binom_loglik <- function(prob, data) {
  if (prob < 0 || prob > 1) {
    return(-Inf)
   }
   return(dbinom(data[, "y"], data[, "n"], prob, log = TRUE))
}
# Make the adjustments
rat_res <- adjust_loglik(loglik = binom_loglik, data = rats, par_names = "p")
summary(rat_res)
plot(rat_res, type = 1:4, legend_pos = "bottom", lwd = 2, col = 1:4)

## ---- fig.align='center', fig.width=7, fig.height=5----------------------
plot(rat_res, type = 1:4, legend_pos = "bottom", lwd = 2, col = 1:4, 
     xlim = c(0, 1))

## ------------------------------------------------------------------------
# 95% confidence intervals, unadjusted and vertically adjusted
conf_intervals(rat_res, type = "none")
conf_intervals(rat_res)
confint(rat_res)

## ------------------------------------------------------------------------
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

# Perform the log-likelihood adjustment of the full model 
par_names <- c("mu[0]", "mu[1]", "sigma[0]", "sigma[1]", "xi[0]", "xi[1]")
large <- adjust_loglik(gev_loglik, data = owtemps, init = init,
                       par_names = par_names)
# Rows 1, 3 and 4 of Table 2 of Chandler and Bate (2007)
round(attr(large, "MLE"), 4)
round(attr(large, "SE"), 4)
round(attr(large, "adjSE"), 4)

## ------------------------------------------------------------------------
# 95% confidence intervals, vertically adjusted
conf_intervals(large)

## ---- fig.align='center', fig.width=7, fig.height=7----------------------
which_pars <- c("sigma[0]", "sigma[1]")
gev_none <- conf_region(large, which_pars = which_pars, type = "none")
gev_vertical <- conf_region(large, which_pars = which_pars)
gev_cholesky <- conf_region(large, which_pars = which_pars, type = "cholesky")
gev_spectral <- conf_region(large, which_pars = which_pars, type = "spectral")
plot(gev_none, gev_cholesky, gev_vertical, gev_spectral, lwd = 2,
     xlim = c(3.0, 4.5), ylim = c(-0.1, 1.25))

## ------------------------------------------------------------------------
medium <- adjust_loglik(larger = large, fixed_pars = "xi[1]")
compare_models(large, medium)
compare_models(large, medium, approx = TRUE)

## ------------------------------------------------------------------------
compare_models(large, fixed_pars = "xi[1]")

## ------------------------------------------------------------------------
small <- adjust_loglik(larger = large, fixed_pars = c("sigma[1]", "xi[1]"))
tiny <- adjust_loglik(larger = large, fixed_pars = c("mu[1]", "sigma[1]", "xi[1]"))
anova(large, medium, small, tiny)
anova(large, medium, small, tiny, approx = TRUE)

## ------------------------------------------------------------------------
set.seed(123)
x <- rnorm(250)
y <- rnbinom(250, mu = exp(1 + x), size = 1)
fm_pois <- glm(y ~ x + I(x^2), family = poisson)
round(summary(fm_pois)$coefficients, 3)

## ------------------------------------------------------------------------
pois_glm_loglik <- function(pars, y, x) {
  log_mu <- pars[1] + pars[2] * x + pars[3] * x ^ 2
  return(dpois(y, lambda = exp(log_mu), log = TRUE))
}
pars <- c("alpha", "beta", "gamma")
pois_quad <- adjust_loglik(pois_glm_loglik, y = y, x = x, par_names = pars)
summary(pois_quad)

## ------------------------------------------------------------------------
# 95% confidence intervals, vertically adjusted
conf_intervals(pois_quad)

## ---- fig.align='center', fig.width=7, fig.height=5----------------------
pois_lin <- adjust_loglik(larger = pois_quad, fixed_pars = "gamma")
pois_vertical <- conf_region(pois_lin)
pois_none <- conf_region(pois_lin, type = "none")
plot(pois_none, pois_vertical, conf = c(50, 75, 95, 99), col = 2:1, lwd = 2, lty = 1)

## ------------------------------------------------------------------------
compare_models(pois_quad, pois_lin)
compare_models(pois_quad, pois_lin, approx = TRUE)

