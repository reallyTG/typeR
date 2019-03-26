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

## ---- roaches-data-------------------------------------------------------
head(roaches) # see help("rstanarm-datasets")
roaches$roach100 <- roaches$roach1 / 100 # pre-treatment number of roaches (in 100s)

## ---- roaches-model, results='hide', warning=FALSE, message=FALSE--------
fit_poisson <- stan_glm(
  y ~ roach100 + treatment + senior,
  offset = log(exposure2),
  family = poisson(link = "log"),
  data = roaches,
  seed = 1111
)

## ---- print--------------------------------------------------------------
print(fit_poisson)

## ---- results='hide', warning=FALSE, message=FALSE-----------------------
fit_nb <- update(fit_poisson, family = "neg_binomial_2")

## ---- print-2------------------------------------------------------------
print(fit_nb)

## ---- y------------------------------------------------------------------
y <- roaches$y

## ---- yrep---------------------------------------------------------------
yrep_poisson <- posterior_predict(fit_poisson, draws = 500)
yrep_nb <- posterior_predict(fit_nb, draws = 500)
dim(yrep_poisson)
dim(yrep_nb)

## ----ppc_dens_overlay----------------------------------------------------
color_scheme_set("brightblue")
ppc_dens_overlay(y, yrep_poisson[1:50, ])

## ----ppc_hist, message=FALSE---------------------------------------------
ppc_hist(y, yrep_poisson[1:5, ])

## ----ppc_hist-nb, message=FALSE------------------------------------------
ppc_hist(y, yrep_nb[1:5, ])

## ----ppc_hist-nb-2, message=FALSE----------------------------------------
ppc_hist(y, yrep_nb[1:5, ], binwidth = 20) + 
  coord_cartesian(xlim = c(-1, 500))

## ---- prop_zero----------------------------------------------------------
prop_zero <- function(x) mean(x == 0)
prop_zero(y) # check proportion of zeros in y

## ----ppc_stat, message=FALSE---------------------------------------------
ppc_stat(y, yrep_poisson, stat = "prop_zero", binwidth = 0.005)

## ----ppc_stat-nb, message=FALSE------------------------------------------
ppc_stat(y, yrep_nb, stat = "prop_zero")

## ----ppc_stat-max, message=FALSE-----------------------------------------
ppc_stat(y, yrep_poisson, stat = "max")
ppc_stat(y, yrep_nb, stat = "max")
ppc_stat(y, yrep_nb, stat = "max", binwidth = 100) + 
  coord_cartesian(xlim = c(-1, 5000))

## ---- available_ppc------------------------------------------------------
available_ppc()

## ---- available_ppc-grouped----------------------------------------------
available_ppc(pattern = "_grouped")

## ----ppc_stat_grouped, message=FALSE-------------------------------------
ppc_stat_grouped(y, yrep_nb, group = roaches$treatment, stat = "prop_zero")

## ---- pp_check.foo-------------------------------------------------------
# @param object An object of class "foo".
# @param type The type of plot.
# @param ... Optional arguments passed on to the bayesplot plotting function.
pp_check.foo <- function(object, type = c("multiple", "overlaid"), ...) {
  type <- match.arg(type)
  y <- object[["y"]]
  yrep <- object[["yrep"]]
  stopifnot(nrow(yrep) >= 50)
  samp <- sample(nrow(yrep), size = ifelse(type == "overlaid", 50, 5))
  yrep <- yrep[samp, ]
  
  if (type == "overlaid") {
    ppc_dens_overlay(y, yrep, ...) 
  } else {
    ppc_hist(y, yrep, ...)
  }
}

## ---- foo-object---------------------------------------------------------
x <- list(y = rnorm(200), yrep = matrix(rnorm(1e5), nrow = 500, ncol = 200))
class(x) <- "foo"

## ---- pp_check-1, message=FALSE------------------------------------------
color_scheme_set("purple")
pp_check(x, type = "multiple", binwidth = 0.3)

## ---- pp_check-2---------------------------------------------------------
color_scheme_set("darkgray")
pp_check(x, type = "overlaid")

