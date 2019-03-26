params <-
list(EVAL = FALSE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require(knitr))
opts_chunk$set(
  comment=NA, 
  message = FALSE, 
  warning = FALSE, 
  eval = params$EVAL,
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center"
)

## ---- count-roaches-mcmc, results="hide"---------------------------------
#  library(rstanarm)
#  data(roaches)
#  
#  # Rescale
#  roaches$roach1 <- roaches$roach1 / 100
#  # Estimate original model
#  glm1 <- glm(y ~ roach1 + treatment + senior, offset = log(exposure2),
#              data = roaches, family = poisson)
#  # Estimate Bayesian version with stan_glm
#  stan_glm1 <- stan_glm(y ~ roach1 + treatment + senior, offset = log(exposure2),
#                        data = roaches, family = poisson,
#                        prior = normal(0,2.5), prior_intercept = normal(0,5),
#                        chains = CHAINS, cores = CORES, seed = SEED)

## ---- count-roaches-comparison-------------------------------------------
#  round(rbind(glm = coef(glm1), stan_glm = coef(stan_glm1)), digits = 2)
#  round(rbind(glm = summary(glm1)$coefficients[, "Std. Error"],
#              stan_glm = se(stan_glm1)), digits = 3)

## ---- count-roaches-posterior_predict------------------------------------
#  yrep <- posterior_predict(stan_glm1)

## ---- count-roaches-plot-pp_check1---------------------------------------
#  prop_zero <- function(y) mean(y == 0)
#  (prop_zero_test1 <- pp_check(stan_glm1, plotfun = "stat", stat = "prop_zero"))

## ---- count-roaches-negbin, results="hide"-------------------------------
#  stan_glm2 <- update(stan_glm1, family = neg_binomial_2)

## ---- count-roaches-plot-pp_check2, fig.width=7, out.width="80%"---------
#  if (require(gridExtra)) {
#    prop_zero_test2 <- pp_check(stan_glm2, plotfun = "stat", stat = "prop_zero")
#    # Show graphs for Poisson and negative binomial side by side
#    grid.arrange(prop_zero_test1 + ggtitle("Poisson"),
#                 prop_zero_test2 + ggtitle("Negative Binomial"),
#                 ncol = 2)
#  }

## ---- count-roaches-loo--------------------------------------------------
#  loo1 <- loo(stan_glm1)
#  loo2 <- loo(stan_glm2)
#  compare_models(loo1, loo2)

