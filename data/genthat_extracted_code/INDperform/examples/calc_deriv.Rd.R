library(INDperform)


### Name: calc_deriv
### Title: Calculate the derivatives of the IND response functions and the
###   proportion of pressure range in which the response is significant
### Aliases: calc_deriv

### ** Examples

## No test: 
# Using some models of the Baltic Sea demo data
init_tbl <- ind_init_ex[ind_init_ex$id %in% c(5,9,48,75), ]
mod_tbl <- merge_models_ex[merge_models_ex$id  %in% c(5,9,48,75), ]
deriv_tbl <- calc_deriv(init_tbl=init_tbl, mod_tbl=mod_tbl,
  n_boot = 40, par_comp = FALSE, seed=1)
## End(No test)



