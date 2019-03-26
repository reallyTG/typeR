library(pmpp)


### Name: pmpp_predinterval
### Title: Random-Window Block Bootstrap for prediction intervals for PMPP
###   model
### Aliases: pmpp_predinterval

### ** Examples

## Not run: 
##D data(EmplUK, package = "plm")
##D EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
##D pmpp_model <- pmpp(dep_var = "emp", data = EmplUK)
##D my_fframe <- create_fframe(EmplUK, 1983:1985)
##D intervals <- pmpp_predinterval(pmpp_model, my_fframe, boot_reps = 10)
## End(Not run)



