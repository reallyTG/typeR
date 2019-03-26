## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(clusteredinterference)

## ------------------------------------------------------------------------
data("toy_data") 

## ------------------------------------------------------------------------
set.seed(1113)
causal_fx <- policyFX(
  data = toy_data,
  formula = Outcome | Treatment ~ Age + Distance + (1 | Cluster_ID) | Cluster_ID,
  alphas = c(.3, .5), 
  k_samps = 1
)


## ------------------------------------------------------------------------
summary(causal_fx)

## ---- eval = FALSE-------------------------------------------------------
#  outcome | treatment ~ predictors and random intercept | clustering specification

## ---- eval = FALSE-------------------------------------------------------
#  Treatment ~ Age + Distance + (1 | Cluster_ID)

## ---- eval = FALSE-------------------------------------------------------
#  root_options = list(atol = 1e-7)

## ------------------------------------------------------------------------
my_grid <- makeTargetGrid(alphas = (3:8)/20, small_grid = TRUE) 
head(my_grid)

## ------------------------------------------------------------------------
my_grid$estVar <- FALSE

## ------------------------------------------------------------------------
causal_fx2 <- policyFX(
  data = toy_data,
  formula = Outcome | Treatment ~ Age + Distance + (1 | Cluster_ID) | Cluster_ID,
  # alphas = c(.3, .5), 
  target_grid = my_grid,
  k_samps = 5,
  verbose = FALSE,
  root_options = list(atol=1e-4)
)

print(causal_fx, nrows = 9)

## ---- fig.width = 6, fig.height = 5--------------------------------------
plotdat <- causal_fx2$estimates[causal_fx2$estimates$estimand_type=="mu",]
plot(x = plotdat$alpha1, y = plotdat$estimate, main = "Estimated Population Means")

## ------------------------------------------------------------------------
# Returns the specified formula, coerced to a Formula object
causal_fx$formula
# causal_fx$model is a glmerMod S4 object
causal_fx$model@call
lme4::getME(causal_fx$model, c("beta", "theta"))

