library(kidney.epi)


### Name: service.is.param_possible
### Title: Service functions for data check which could be applied in any
###   function of the package or externally
### Aliases: service.is.param_possible

### ** Examples

possible_params = c("KDPI", " KDRI_Rao", "KDRI_median")
service.is.param_possible("KDZO", possible_params) # return FALSE
service.is.param_possible("KDPI", possible_params) # return TRUE



