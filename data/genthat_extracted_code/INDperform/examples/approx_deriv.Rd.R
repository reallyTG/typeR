library(INDperform)


### Name: approx_deriv
### Title: Alternative method for confidence interval approximations of
###   derivatives
### Aliases: approx_deriv

### ** Examples

# Using some models of the Baltic Sea demo data
init_tbl <- ind_init_ex[ind_init_ex$id %in% c(5,9,75), ]
mod_tbl <- merge_models_ex[merge_models_ex$id  %in% c(5,9,75), ]
deriv_tbl <- approx_deriv(init_tbl, mod_tbl, ci_prop_se = 25)



