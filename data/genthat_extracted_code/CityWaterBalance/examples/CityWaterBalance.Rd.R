library(CityWaterBalance)


### Name: CityWaterBalance
### Title: Tracks flows of water through the urban system
### Aliases: CityWaterBalance

### ** Examples

p <- list("interc" = 0, "et_mult" = 1, "flow_mult" = 1, 
         "open_wat" = 0.02, "run_mult" = 3.378, "run_css" = 0.35, 
         "bf_mult" = 1, "nonrev" = 0.08, "ind_evap" = 0.012,
         "wast_gen" = 0.85, "pot_atm" = 0.13, "npot_infilt" = 0.5,
         "slud_evap" = 0, "leak_css" = 0.05,"dgw" = 0.5, "dgw_rep" = 0.5)
m <- CityWaterBalance(cwb_data, p) 



