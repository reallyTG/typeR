library(CityWaterBalance)


### Name: getSolutions
### Title: Evaluate parameter uncertainty
### Aliases: getSolutions

### ** Examples

## Not run: 
##D data <- cwb_data
##D data$cso <- 0
##D p <- list("interc" = 0,"et_mult" = 1,"flow_mult" = 1, "open_wat" = 0.02, 
##D           "run_mult" = 3.378, "run_css" = 0.35, "bf_mult" = 1, 
##D           "nonrev" = 0.08, "ind_evap" = 0.012, "wast_gen" = 0.85, 
##D           "pot_atm" = 0.13, "npot_infilt" = 0.5, "slud_evap" = 0,
##D           "leak_css" = 0.05, "dgw" = 0.5, "dgw_rep" = 0.5)
##D out <- getSolutions(data, p, 10, 0.1)
## End(Not run)



