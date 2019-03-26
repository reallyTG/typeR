library(weibulltools)


### Name: mcs_delay_register
### Title: Adjustment of Operating Times by Delays in Registration using a
###   Monte Carlo Approach
### Aliases: mcs_delay_register

### ** Examples

date_of_production   <- c("2014-07-28", "2014-02-17", "2014-07-14",
                          "2014-06-26", "2014-03-10", "2014-05-14",
                          "2014-05-06", "2014-03-07", "2014-03-09",
                          "2014-04-13", "2014-05-20", "2014-07-07",
                          "2014-01-27", "2014-01-30", "2014-03-17",
                          "2014-02-09", "2014-04-14", "2014-04-20",
                          "2014-03-13", "2014-02-23", "2014-04-03",
                          "2014-01-08", "2014-01-08")
date_of_registration <- c(NA, "2014-03-29", "2014-12-06", "2014-09-09",
                          NA, NA, "2014-06-16", NA, "2014-05-23",
                          "2014-05-09", "2014-05-31", NA, "2014-04-13",
                          NA, NA, "2014-03-12", NA, "2014-06-02",
                          NA, "2014-03-21", "2014-06-19", NA, NA)

op_time <- rep(1000, length(date_of_production))
state <- c(0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0)

# Example 1 - Simplified vector output:
x_corrected <- mcs_delay_register(date_prod = date_of_production,
                                  date_register = date_of_registration,
                                  x = op_time,
                                  event = state,
                                  distribution = "lognormal",
                                  seed = NULL,
                                  details = FALSE)

# Example 2 - Detailed list output:
list_detail <- mcs_delay_register(date_prod = date_of_production,
                                  date_register = date_of_registration,
                                  x = op_time,
                                  event = state,
                                  distribution = "lognormal",
                                  seed = NULL,
                                  details = TRUE)



