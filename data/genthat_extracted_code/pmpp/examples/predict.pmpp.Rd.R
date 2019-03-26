library(pmpp)


### Name: predict.pmpp
### Title: Compute forecasts with a PMPP model
### Aliases: predict.pmpp

### ** Examples

data(EmplUK, package = "plm")
EmplUK <- dplyr::filter(EmplUK, year %in% c(1978, 1979, 1980, 1981, 1982))
pmpp_model <- pmpp(dep_var = "emp", data = EmplUK)
my_fframe <- create_fframe(EmplUK, 1983:1985)
prediction <- predict(pmpp_model, my_fframe)



