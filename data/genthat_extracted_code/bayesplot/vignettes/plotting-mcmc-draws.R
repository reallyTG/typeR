params <-
list(EVAL = TRUE)

## ---- SETTINGS-knitr, include=FALSE--------------------------------------
stopifnot(require("knitr"))
library("bayesplot")
knitr::opts_chunk$set(
  dev = "png",
  dpi = 150,
  fig.asp = 0.618,
  fig.width = 5,
  out.width = "60%",
  fig.align = "center",
  comment = NA,
  eval = params$EVAL
)

## ---- pkgs, include=FALSE------------------------------------------------
library("ggplot2")
library("rstanarm")

## ---- eval=FALSE---------------------------------------------------------
#  library("bayesplot")
#  library("ggplot2")
#  library("rstanarm")

## ---- mtcars-------------------------------------------------------------
head(mtcars) # see help("mtcars")

## ---- eval=FALSE---------------------------------------------------------
#  # linear regression model using stan_glm
#  # using '~ .' to include all variables
#  fit <- stan_glm(mpg ~ ., data = mtcars, seed = 1111)
#  print(fit)

## ----stan_glm, include=FALSE---------------------------------------------
fit <- stan_glm(mpg ~ ., data = mtcars, QR = TRUE, seed = 1111)

## ---- print-fit, echo=FALSE----------------------------------------------
print(fit)

## ---- get-draws----------------------------------------------------------
posterior <- as.array(fit)
dim(posterior)
dimnames(posterior)

## ---- mcmc_intervals-----------------------------------------------------
color_scheme_set("red")
mcmc_intervals(posterior, pars = c("cyl", "drat", "am", "sigma"))

## ---- mcmc_areas---------------------------------------------------------
mcmc_areas(
  posterior, 
  pars = c("cyl", "drat", "am", "sigma"),
  prob = 0.8, # 80% intervals
  prob_outer = 0.99, # 99%
  point_est = "mean"
)

## ---- mcmc_hist, message=FALSE-------------------------------------------
color_scheme_set("green")
mcmc_hist(posterior, pars = c("wt", "sigma"))

## ---- mcmc_hist-transform, message=FALSE---------------------------------
color_scheme_set("blue")
mcmc_hist(posterior, pars = c("wt", "sigma"), 
          transformations = list("sigma" = "log"))

## ---- mcmc_hist_by_chain, message=FALSE----------------------------------
color_scheme_set("brightblue")
mcmc_hist_by_chain(posterior, pars = c("wt", "sigma"))

## ---- mcmc_dens, message=FALSE-------------------------------------------
color_scheme_set("purple")
mcmc_dens(posterior, pars = c("wt", "sigma"))

## ---- mcmc_dens_overlay, message=FALSE-----------------------------------
mcmc_dens_overlay(posterior, pars = c("wt", "sigma"))

## ---- mcmc_violin--------------------------------------------------------
color_scheme_set("teal")
mcmc_violin(posterior, pars = c("wt", "sigma"), probs = c(0.1, 0.5, 0.9))

## ---- mcmc_scatter-------------------------------------------------------
color_scheme_set("gray")
mcmc_scatter(posterior, pars = c("(Intercept)", "wt"), 
             size = 1.5, alpha = 0.5)

## ---- mcmc_hex-----------------------------------------------------------
mcmc_hex(posterior, pars = c("(Intercept)", "wt"))

## ---- mcmc_pairs, message=FALSE------------------------------------------
color_scheme_set("pink")
mcmc_pairs(posterior, pars = c("(Intercept)", "wt", "sigma"),
           off_diag_args = list(size = 1.5))

## ---- mcmc_trace---------------------------------------------------------
color_scheme_set("blue")
mcmc_trace(posterior, pars = c("wt", "sigma"))

## ---- change-scheme------------------------------------------------------
color_scheme_set("mix-blue-red")
mcmc_trace(posterior, pars = c("wt", "sigma"), 
           facet_args = list(ncol = 1, strip.position = "left"))

## ---- viridis-scheme-----------------------------------------------------
color_scheme_set("viridis")
mcmc_trace(posterior, pars = "(Intercept)")

## ---- mcmc_trace_highlight-----------------------------------------------
mcmc_trace_highlight(posterior, pars = "sigma", highlight = 3)

