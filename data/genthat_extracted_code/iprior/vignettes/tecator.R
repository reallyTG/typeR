## ---- include = FALSE----------------------------------------------------
library(iprior)

## ------------------------------------------------------------------------
data(tecator, package = "caret")
fat <- endpoints[, 2]
absorp <- -t(diff(t(absorp)))  # take first differences
mod1 <- iprior(fat, absorp, train.samp = 1:172, method = "mixed")

## ------------------------------------------------------------------------
get_prederror(mod1)

## ---- eval = FALSE-------------------------------------------------------
#  (mod1.cv <- iprior_cv(fat, absorp, method = "em",
#                        control = list(stop.crit = 1e-2), folds = Inf))

## ---- echo = FALSE-------------------------------------------------------
data(tecator.cv, package = "iprior")
print(tecator.cv[[1]], "RMSE")

## ---- eval = FALSE-------------------------------------------------------
#  mod2.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "poly2",
#                       est.offset = TRUE, control = list(stop.crit = 1e-2))
#  mod3.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "poly3",
#                       est.offset = TRUE, control = list(stop.crit = 1e-2))
#  mod4.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "fbm",
#                       control = list(stop.crit = 1e-2))
#  mod5.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "fbm",
#                       est.hurst = TRUE, control = list(stop.crit = 1e-2))
#  mod6.cv <- iprior_cv(fat, absorp, method = "em", folds = Inf, kernel = "se",
#                       est.lengthscale = TRUE, control = list(stop.crit = 1e-2))
#  
#  # Function to tabulate the results
#  tecator_tab_cv <- function() {
#    tab <- t(sapply(list(mod1.cv, mod2.cv, mod3.cv, mod4.cv, mod5.cv, mod6.cv),
#                    function(mod) {
#                      res <- as.numeric(apply(sqrt(mod$mse[, -1]), 2, mean))
#                      c("Training MSE" = res[1], "Test MSE" = res[2])
#                      }))
#    rownames(tab) <- c("Linear", "Quadratic", "Cubic", "fBm-0.5", "fBm-MLE",
#                       "SE-MLE")
#    tab
#  }

## ---- echo = FALSE-------------------------------------------------------
knitr::kable(iprior::dec_plac(tecator.cv[[7]], 2), align = "r", caption = "Results for the LOOCV experiment for various I-prior models.")

