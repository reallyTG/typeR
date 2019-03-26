## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

required <- c("lars", "mboost")
if (!all(sapply(required, function(pkg) requireNamespace(pkg, quietly = TRUE))))
    knitr::opts_chunk$set(eval = FALSE)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("stabs")

## ---- eval = FALSE-------------------------------------------------------
#  library("devtools")
#  install_github("hofnerb/stabs")

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("devtools")

## ------------------------------------------------------------------------
library("stabs")
library("lars")
## make data set available
data("bodyfat", package = "TH.data")
## set seed
set.seed(1234)

## lasso
(stab.lasso <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                       fitfun = lars.lasso, cutoff = 0.75,
                       PFER = 1))

## stepwise selection
(stab.stepwise <- stabsel(x = bodyfat[, -2], y = bodyfat[,2],
                          fitfun = lars.stepwise, cutoff = 0.75,
                          PFER = 1))

## ----plot1, fig.height=7, fig.width=14, out.width="90%"------------------
## plot results
par(mfrow = c(1, 2))
plot(stab.lasso, main = "Lasso")
plot(stab.stepwise, main = "Stepwise Selection")

## ------------------------------------------------------------------------
lars.lasso

## ------------------------------------------------------------------------
library("stabs")
library("mboost")
### low-dimensional example
mod <- glmboost(DEXfat ~ ., data = bodyfat)

## compute cutoff ahead of running stabsel to see if it is a sensible
## parameter choice.
##   p = ncol(bodyfat) - 1 (= Outcome) + 1 ( = Intercept)
stabsel_parameters(q = 3, PFER = 1, p = ncol(bodyfat) - 1 + 1,
                   sampling.type = "MB")
## the same:
stabsel(mod, q = 3, PFER = 1, sampling.type = "MB", eval = FALSE)

## now run stability selection
(sbody <- stabsel(mod, q = 3, PFER = 1, sampling.type = "MB"))

## ----plot2, fig.height=7, fig.width=14, out.width="90%"------------------
opar <- par(mai = par("mai") * c(1, 1, 1, 2.7), mfrow = c(1, 2))
plot(sbody, type = "paths")
plot(sbody, type = "maxsel", ymargin = 6)
par(opar)

## ---- results='hide'-----------------------------------------------------
citation("stabs")

## ---- echo = FALSE-------------------------------------------------------
citation("stabs")

## ---- eval = FALSE-------------------------------------------------------
#  toBibtex(citation("stabs"))

