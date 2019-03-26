## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 6,
  fig.height = 6
)

## ---- echo = TRUE--------------------------------------------------------
library("brglm2")
data("alligators", package = "brglm2")

## ---- echo = TRUE--------------------------------------------------------
agresti_contrasts <- list(lake = contr.treatment(levels(alligators$lake), base = 4),
                          size = contr.treatment(levels(alligators$size), base = 2))
all_ml <- brmultinom(foodchoice ~ size + lake , weights = freq,
                     data = alligators,
                     contrasts = agresti_contrasts,
                     ref = 1,
                     type = "ML")
all_ml_summary <- summary(all_ml)
## Estimated regression parameters
round(all_ml_summary$coefficients, 2)
## Estimated standard errors
round(all_ml_summary$standard.errors, 2)

## ---- echo = TRUE--------------------------------------------------------
all_mean <- update(all_ml, type = "AS_mean")
summary(all_mean)

## ---- echo = TRUE--------------------------------------------------------
all_median <- update(all_ml, type = "AS_median")
summary(all_median)

## ---- echo = TRUE, error = TRUE------------------------------------------
all_ml_sparse <- update(all_ml, weights = round(freq/3), slowit = 0.2)
summary(all_ml_sparse)

## ---- echo = TRUE--------------------------------------------------------
se_ratios <- check_infinite_estimates(all_ml_sparse)
matplot(se_ratios, type = "l", lty = 1, ylim = c(0.5, 1.5), xlab = "Iteration")

## ---- echo = TRUE--------------------------------------------------------
all_mean_sparse <- update(all_ml_sparse, type = "AS_mean")
summary(all_mean_sparse)

all_median_sparse <- update(all_ml_sparse, type = "AS_median")
summary(all_median_sparse)

## ---- echo = TRUE--------------------------------------------------------
citation("brglm2")

