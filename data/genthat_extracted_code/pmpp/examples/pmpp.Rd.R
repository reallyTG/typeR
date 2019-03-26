library(pmpp)


### Name: pmpp
### Title: Posterior Mean Panel Predictor for dynamic panel modelling
### Aliases: pmpp

### ** Examples

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
pmpp_model <- pmpp(dep_var = "emp", data = EmplUK)



