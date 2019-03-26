library(INDperform)


### Name: loocv_thresh_gam
### Title: Leave-One-Out Cross-Validation (LOOCV) procedure for
###   (threshold-)GAMs
### Aliases: loocv_thresh_gam
### Keywords: internal

### ** Examples

# Using the first model in the Baltic Sea demo data
loocv_thresh_gam(model = model_gam_ex$model[[1]],
  ind_vec = ind_init_ex$ind_train[[1]],
  press_vec = ind_init_ex$press_train[[1]],
  t_var_vec = ind_init_ex$press_train[[2]],
  name_t_var = "Swin",
  k = 4, a = 0.2, b = 0.8,
  time = ind_init_ex$time_train[[1]])



