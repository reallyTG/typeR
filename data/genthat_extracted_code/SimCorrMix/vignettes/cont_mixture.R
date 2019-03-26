## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, warning=FALSE, fig.width = 6, fig.height = 4, fig.align = "center")

## ---- include=FALSE------------------------------------------------------
library("bookdown")

## ------------------------------------------------------------------------
library("SimCorrMix")
library("printr")
options(scipen = 999)
n <- 10000
mix_pis <- c(0.4, 0.6)
mix_mus <- c(-2, 2)
mix_sigmas <- c(1, 1)
mix_skews <- rep(0, 2)
mix_skurts <- rep(0, 2)
mix_fifths <- rep(0, 2)
mix_sixths <- rep(0, 2)
Nstcum <- calc_mixmoments(mix_pis, mix_mus, mix_sigmas, mix_skews, 
  mix_skurts, mix_fifths, mix_sixths)

## ------------------------------------------------------------------------
validpar(k_mix = 1, method = "Polynomial", means = Nstcum[1], 
  vars = Nstcum[2]^2, mix_pis = mix_pis, mix_mus = mix_mus, 
  mix_sigmas = mix_sigmas, mix_skews = mix_skews, mix_skurts = mix_skurts, 
  mix_fifths = mix_fifths, mix_sixths = mix_sixths)
Nmix2 <- contmixvar1(n, "Polynomial", Nstcum[1], Nstcum[2]^2, mix_pis, mix_mus, 
  mix_sigmas, mix_skews, mix_skurts, mix_fifths, mix_sixths)

## ------------------------------------------------------------------------
SumN <- summary_var(Y_comp = Nmix2$Y_comp, Y_mix = Nmix2$Y_mix, 
  means = Nstcum[1], vars = Nstcum[2]^2, mix_pis = mix_pis, mix_mus = mix_mus, 
  mix_sigmas = mix_sigmas, mix_skews = mix_skews, mix_skurts = mix_skurts, 
  mix_fifths = mix_fifths, mix_sixths = mix_sixths)
knitr::kable(SumN$target_mix, digits = 5, row.names = FALSE, 
  caption = "Summary of Target Distribution")
knitr::kable(SumN$mix_sum, digits = 5, row.names = FALSE, 
  caption = "Summary of Simulated Distribution")

## ------------------------------------------------------------------------
Nmix2$constants
Nmix2$valid.pdf

## ------------------------------------------------------------------------
fx <- function(x) 0.4 * dnorm(x, -2, 1) + 0.6 * dnorm(x, 2, 1)
cfx <- function(x, alpha, FUN = fx) {
  integrate(function(x, FUN = fx) FUN(x), -Inf, x, subdivisions = 1000, 
    stop.on.error = FALSE)$value - (1 - alpha)
}
y_star <- uniroot(cfx, c(3.3, 3.4), tol = 0.001, alpha = 0.05)$root
y_star

## ------------------------------------------------------------------------
sim_cdf_prob(sim_y = Nmix2$Y_mix[, 1], delta = y_star)$cumulative_prob

## ------------------------------------------------------------------------
plot_simpdf_theory(sim_y = Nmix2$Y_mix[, 1], ylower = -10, yupper = 10, 
  title = "PDF of Mixture of Normal Distributions", fx = fx, lower = -Inf, 
  upper = Inf)

## ------------------------------------------------------------------------
plot_sim_cdf(sim_y = Nmix2$Y_mix[, 1], calc_cprob = TRUE, delta = y_star)

