library(weibulltools)


### Name: dist_mileage
### Title: Parameter Estimation of the Mileage Distribution
### Aliases: dist_mileage

### ** Examples

date_of_registration <- c(NA, "2014-03-29", "2014-12-06", "2014-09-09", NA,
                          NA, "2014-06-16", NA, "2014-05-23", "2014-05-09",
                          "2014-05-31", NA, "2014-04-13", NA, NA, "2014-03-12",
                          NA, "2014-06-02", NA, "2014-03-21", "2014-06-19",
                          NA, NA)
date_of_repair <- c(NA, "2014-09-15", "2015-07-04", "2015-04-10", NA,
                    NA, "2015-04-24", NA, "2015-04-25", "2015-04-24",
                    "2015-06-12", NA, "2015-05-04", NA, NA, "2015-05-22",
                    NA, "2015-09-17", NA, "2015-08-15", "2015-11-26", NA, NA)

op_time <- as.numeric(difftime(as.Date(date_of_repair),
                               as.Date(date_of_registration),
                               units = "days"))
mileage <- c(NA, 15655, 13629, 18292, NA, NA, 33555, NA, 21737,
             29870, 21068, NA, 122283, NA, NA, 36088, NA, 11153,
             NA, 122842, 20349, NA, NA)
state <- c(0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0)

params_mileage_annual <- dist_mileage(x = op_time, event = state,
                                      mileage = mileage,
                                      distribution = "lognormal")



