## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)
set.seed(47)

required <- c("bayesplot", "ggplot2")

if (!all(unlist(lapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE)))))
  knitr::opts_chunk$set(eval = FALSE)

## ------------------------------------------------------------------------
library(bang)
# Beta-binomial rat tumor example
rat_res <- hef(model = "beta_binom", data = rat, nrep = 50)
# Gamma-Poisson pump failure example
pump_res <- hef(model = "gamma_pois", data = pump, nrep = 50)
# 1-way Hierarchical ANOVA global warming example
RCP26_2 <- temp2[temp2$RCP == "rcp26", ]
temp_res <- hanova1(resp = RCP26_2[, 1], fac = RCP26_2[, 2], nrep = 50)

## ---- fig.show='hold', fig.width = 3.45, fig.height = 3.45---------------
library(bayesplot)
library(ggplot2)
# Overlaid density estimates
pp_check(rat_res)
# Overlaid distribution function estimates
pp_check(rat_res, fun = "ecdf_overlay")

## ---- fig.show='hold', fig.width = 7, fig.height = 5---------------------
# Multiple histograms
pp_check(rat_res, fun = "hist", nrep = 8)
# Multiple boxplots
pp_check(rat_res, fun = "boxplot")

## ---- fig.show='hold', fig.width = 7, fig.height = 5---------------------
# Predictive medians vs observed median
pp_check(rat_res, fun = "stat", stat = "median")
# Predictive (mean, sd) vs observed (mean, sd)
pp_check(rat_res, fun = "stat_2d", stat = c("mean", "sd"))

## ---- fig.show='hold', fig.width = 7, fig.height = 5---------------------
# Overlaid density estimates
pp_check(pump_res)
# Predictive (mean, sd) vs observed (mean, sd)
pp_check(pump_res, fun = "stat_2d", stat = c("mean", "sd"))

## ---- fig.show='hold', fig.width = 7, fig.height = 5---------------------
# Overlaid density estimates
pp_check(temp_res)
# Predictive (mean, sd) vs observed (mean, sd)
pp_check(temp_res, fun = "stat_2d", stat = c("mean", "sd"))

