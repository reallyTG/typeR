library(INDperform)


### Name: calc_pred
### Title: Calculate predicted values and their confidence intervals for
###   GAM(M)s
### Aliases: calc_pred
### Keywords: internal

### ** Examples

# Using the Baltic Sea demo data
model_list <- model_gam_ex$model
obs_press <- ind_init_ex$press_train
x <- calc_pred(model_list, obs_press)



