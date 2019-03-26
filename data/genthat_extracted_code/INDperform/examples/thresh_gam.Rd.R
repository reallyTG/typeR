library(INDperform)


### Name: thresh_gam
### Title: Fits a GAM with a threshold-formulation
### Aliases: thresh_gam
### Keywords: internal

### ** Examples

# Using some models of the Baltic Sea demo data in this package
test <- thresh_gam(model = model_gam_ex$model[[1]],
  ind_vec = ind_init_ex$ind_train[[1]],
  press_vec = ind_init_ex$press_train[[1]],
  t_var = ind_init_ex$press_train[[2]],
  name_t_var = "Ssum", k = 4, a = 0.2, b = 0.8)



