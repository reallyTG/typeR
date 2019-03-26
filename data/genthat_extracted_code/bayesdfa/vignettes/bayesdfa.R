## ----set-knitr-options, cache=FALSE, echo=FALSE, warning=FALSE, message=FALSE----
library("knitr")
opts_chunk$set(message = FALSE, fig.width = 5.5)

## ---- message=FALSE, warning=FALSE---------------------------------------
library(bayesdfa)
library(ggplot2)
library(dplyr)

## ----simulate-data-------------------------------------------------------
set.seed(1)
sim_dat <- sim_dfa(
  num_trends = 2,
  num_years = 20,
  num_ts = 4
)

## ----simulate-data-plot, fig.align='center', fig.cap="Simulated data, from a model with 2 latent trends and no extremes.\\label{fig:simulate-data-plot}"----
matplot(t(sim_dat$y_sim),
  type = "l",
  ylab = "Response", xlab = "Time"
)

## ----fit-1-trend, message=FALSE, warning=FALSE, results='hide'-----------
f1 <- fit_dfa(
  y = sim_dat$y_sim, num_trends = 1, zscore = TRUE,
  iter = 200, chains = 1, thin = 1
)

## ------------------------------------------------------------------------
is_converged(f1, threshold = 1.05)

## ----rot-1-trend, warning=FALSE, message=FALSE, results='hide'-----------
r <- rotate_trends(f1)

## ------------------------------------------------------------------------
names(r)

## ----plot-1-trend, fig.align='center', fig.cap="Estimated trend and 95% CI for a 1-trend DFA model applied to simulated data.\\label{fig:simulate-data-plot}"----
plot_trends(r)

## ----plot-1-fitted-example, fig.align='center', fig.cap="Model predicted values from the 1-trend DFA model applied to simulated data.\\label{fig:fitted-example}"----
plot_fitted(f1)

## ----fit-models, warning=FALSE, results='hide', message=FALSE------------
f2 <- fit_dfa(
  y = sim_dat$y_sim, num_trends = 2, zscore = TRUE,
  iter = 200, chains = 1, thin = 1
)
r2 <- rotate_trends(f2)

f3 <- fit_dfa(
  y = sim_dat$y_sim, num_trends = 3, zscore = TRUE,
  iter = 200, chains = 1, thin = 1
)
r3 <- rotate_trends(f3)

## ----plot-2-fitted-example, fig.align='center', fig.cap="Model predicted values from the 2-trend DFA model applied to simulated data.\\label{fig:fitted-example2}"----
plot_fitted(f2)

## ------------------------------------------------------------------------
round(r2$Z_rot_mean, 2)

## ----plot-loadings, fig.align='center', fig.cap="Estimated loadings from the 2-trend DFA model.\\label{fig:plot-loadings}"----
plot_loadings(r2)

## ----loo, warning=FALSE, message=FALSE-----------------------------------
loo1 <- loo(f1)
loo1$estimates

## ----eval=FALSE----------------------------------------------------------
#  m <- find_dfa_trends(
#    y = s$y_sim, iter = 180,
#    kmin = 1, kmax = 5, chains = 1, compare_normal = TRUE,
#    variance = c("equal", "unequal")
#  )

## ----simulate-data2------------------------------------------------------
set.seed(1)
sim_dat <- sim_dfa(
  num_trends = 2,
  num_years = 20, num_ts = 4,
  extreme_value = 6
)

## ----simulate-data-plot2, fig.align='center', fig.cap="Simulated data, from a model with 2 latent trends and an extreme in the midpoint of the time series.\\label{fig:simulate-data-plot2}"----
matplot(t(sim_dat$y_sim), type = "l", ylab = "Response", xlab = "Time")

## ----simulate-data-plot3, fig.align='center', fig.cap="Simulated data (z-scored), from a model with 2 latent trends and an extreme in the midpoint of the time series.\\label{fig:simulate-data-plot3}"----
matplot(scale(t(sim_dat$y_sim)), type = "l", ylab = "Response", xlab = "Time")

## ----fit-2-trend-extreme, message=FALSE, warning=FALSE, results='hide'----
t2 <- fit_dfa(
  y = sim_dat$y_sim, num_trends = 2, zscore = TRUE,
  iter = 200, chains = 1, thin = 1, estimate_nu = TRUE
)

## ----fit-extreme-dfa, fig.align='center', fig.cap="Estimated trends, from a model with 2 latent trends Student-t deviations.\\label{fig:fit-extreme-dfa}"----
r <- rotate_trends(t2)
plot_trends(r)

## ----plot-extreme-loadings, fig.align='center', fig.cap="Estimated loadings, from a model with 2 latent trends Student-t deviations.\\label{fig:plot-extreme-loadings}"----
plot_loadings(r)

## ----eval=FALSE----------------------------------------------------------
#  find_swans(r, plot = FALSE, threshold = 1 / 1000)

## ----summarize-nu--------------------------------------------------------
summary(rstan::extract(t2$model, "nu")[[1]])

## ---- warning=FALSE, message=FALSE, results='hide'-----------------------
reg_mod <- fit_regimes(
  y = r$trends_mean[1, ],
  sds = (r$trends_upper - r$trends_mean)[1, ] / 1.96,
  n_regimes = 2,
  iter = 200, chains = 1
)

## ----plot-regime, fig.align='center', fig.cap="Estimated regimes, from a HMM model applied to the first trend of a 2-trend DFA model with Student-t deviations.\\label{fig:plot-regime}"----
plot_regime_model(reg_mod)

## ----plot-regime-flipped, fig.align='center', fig.cap="Estimated regimes (after flipping), from a HMM model applied to the first trend of a 2-trend DFA model with Student-t deviations.\\label{fig:plot-regime-flipped}"----
plot_regime_model(reg_mod, flip_regimes = TRUE)

