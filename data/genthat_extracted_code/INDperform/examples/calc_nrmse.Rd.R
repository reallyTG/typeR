library(INDperform)


### Name: calc_nrmse
### Title: Calculates the Normalized Root Mean Square Error (NRMSE) as
###   absolute value.
### Aliases: calc_nrmse
### Keywords: internal

### ** Examples

# Using the Baltic Sea demo data
data <- dplyr::left_join(model_gam_ex, ind_init_ex)
pred <- calc_pred(data$model, data$press_test)
x <- calc_nrmse(pred = pred$pred, obs_ind = data$ind_test)



