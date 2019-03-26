## ----libs, results='hide', message=FALSE---------------------------------
library(dissever)

library(raster)
library(viridis)
library(dplyr)
library(magrittr)

## ----plot_coarse, fig.width=6, fig.height=6------------------------------
plot(edgeroi$carbon, col = viridis(100))

## ----plot_fine, fig.width=8, fig.height=6--------------------------------
plot(edgeroi$predictors, col = viridis(100))

## ----params--------------------------------------------------------------
min_iter <- 5 # Minimum number of iterations
max_iter <- 10 # Maximum number of iterations
p_train <- 0.025 # Subsampling of the initial data

## ----process, results='hide', message=FALSE------------------------------
# Random Forest
res_rf <- dissever(
    coarse = edgeroi$carbon, # stack of fine resolution covariates
    fine = edgeroi$predictors, # coarse resolution raster
    method = "rf", # regression method used for disseveration
    p = p_train, # proportion of pixels sampled for training regression model
    min_iter = min_iter, # minimum iterations
    max_iter = max_iter # maximum iterations
  )

# Cubist
res_cubist <- dissever(
  coarse = edgeroi$carbon, 
  fine = edgeroi$predictors, 
  method = "cubist", 
  p = p_train, 
  min_iter = min_iter,
  max_iter = max_iter
)

# GAM
res_gam <- dissever(
  coarse = edgeroi$carbon, 
  fine = edgeroi$predictors, 
  method = "gamSpline", 
  p = p_train, 
  min_iter = min_iter,
  max_iter = max_iter
)

# Linear model
res_lm <- dissever(
  coarse = edgeroi$carbon, 
  fine = edgeroi$predictors, 
  method = "lm", 
  p = p_train, 
  min_iter = min_iter,
  max_iter = max_iter
)

## ----maps, fig.width=8, fig.height=8-------------------------------------
# Plotting maps
par(mfrow = c(2, 2))
plot(res_rf, type = 'map', main = "Random Forest")
plot(res_cubist, type = 'map', main = "Cubist")
plot(res_gam, type = 'map', main = "GAM")
plot(res_lm, type = 'map', main = "Linear Model")

## ----optim, fig.width=8, fig.height=8------------------------------------
# Plot performance
par(mfrow = c(2, 2))
plot(res_rf, type = 'perf', main = "Random Forest")
plot(res_cubist, type = 'perf', main = "Cubist")
plot(res_gam, type = 'perf', main = "GAM")
plot(res_lm, type = 'perf', main = "Linear Model")

## ----preds_obs, fig.width=6, fig.height=4--------------------------------
# Plot preds vs obs
preds <- extractPrediction(list(res_rf$fit, res_cubist$fit, res_gam$fit, res_lm$fit))
plotObsVsPred(preds)

## ----compare-------------------------------------------------------------
# Compare models
perf <- preds %>% 
  group_by(model, dataType) %>% 
  summarise(
    rsq = cor(obs, pred)^2, 
    rmse = sqrt(mean((pred - obs)^2))
  )
perf

## ----ensemble------------------------------------------------------------
# We can weight results with Rsquared
w <- perf$rsq / sum(perf$rsq)

# Make stack of weighted predictions and compute sum
l_maps <- list(res_cubist$map, res_gam$map, res_lm$map, res_rf$map)
ens <- lapply(1:4, function(x) l_maps[[x]] * w[x]) %>%
  stack %>%
  sum

## ----mod_cor-------------------------------------------------------------
s_res <- stack(l_maps)
names(s_res) <- c('Cubist', 'GAM', 'Linear Model', 'Random Forest')
s_res %>%
  as.data.frame %>%
  na.exclude %>%
  cor

## ----ensemble_plot, fig.width=6, fig.height=6----------------------------
# Plot result
plot(ens, col = viridis(100), main = "CCC Weighted Average")

