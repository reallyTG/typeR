library(weibulltools)


### Name: mcs_delays
### Title: Adjustment of Operating Times by Delays using a Monte Carlo
###   Approach
### Aliases: mcs_delays

### ** Examples

date_of_production   <- c("2014-07-28", "2014-02-17", "2014-07-14",
                          "2014-06-26", "2014-03-10", "2014-05-14",
                          "2014-05-06", "2014-03-07", "2014-03-09",
                          "2014-04-13", "2014-05-20", "2014-07-07",
                          "2014-01-27", "2014-01-30", "2014-03-17",
                          "2014-02-09", "2014-04-14", "2014-04-20",
                          "2014-03-13", "2014-02-23", "2014-04-03",
                          "2014-01-08", "2014-01-08")
date_of_registration <- c("2014-08-17", "2014-03-29", "2014-12-06",
                          "2014-09-09", "2014-05-14", "2014-07-01",
                          "2014-06-16", "2014-04-03", "2014-05-23",
                          "2014-05-09", "2014-05-31", "2014-08-12",
                          "2014-04-13", "2014-02-15", "2014-07-07",
                          "2014-03-12", "2014-05-27", "2014-06-02",
                          "2014-05-20", "2014-03-21", "2014-06-19",
                          "2014-02-12", "2014-03-27")
date_of_repair <- c(NA, "2014-09-15", "2015-07-04", "2015-04-10", NA,
                   NA, "2015-04-24", NA, "2015-04-25", "2015-04-24",
                    "2015-06-12", NA, "2015-05-04", NA, NA,
                    "2015-05-22", NA, "2015-09-17", NA, "2015-08-15",
                    "2015-11-26", NA, NA)

date_of_report <- c(NA, "2014-10-09", "2015-08-28", "2015-04-15", NA,
                    NA, "2015-05-16", NA, "2015-05-28", "2015-05-15",
                    "2015-07-11", NA, "2015-08-14", NA, NA,
                    "2015-06-05", NA, "2015-10-17", NA, "2015-08-21",
                    "2015-12-02", NA, NA)

op_time <- rep(1000, length(date_of_repair))
state <- sample(c(0, 1), size = length(date_of_repair), replace = TRUE)

# Example 1 - Simplified vector output:
x_corrected <- mcs_delays(date_prod = date_of_production,
                          date_register = date_of_registration,
                          date_repair = date_of_repair,
                          date_report = date_of_report,
                          x = op_time,
                          event = state,
                          distribution = "lognormal",
                          seed = NULL,
                          details = FALSE)

# Example 2 - Detailed list output:
list_detail <- mcs_delays(date_prod = date_of_production,
                                date_register = date_of_registration,
                                date_repair = date_of_repair,
                                date_report = date_of_report,
                                x = op_time,
                                event = state,
                                distribution = "lognormal",
                                seed = NULL,
                                details = TRUE)



