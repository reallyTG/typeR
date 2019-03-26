library(weibulltools)


### Name: mcs_delay_report
### Title: Adjustment of Operating Times by Delays in Report using a Monte
###   Carlo Approach
### Aliases: mcs_delay_report

### ** Examples

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
state <- c(0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 1, 1, 0, 0)

# Example 1 - Simplified vector output:
x_corrected <- mcs_delay_report(date_repair = date_of_repair,
                                date_report = date_of_report,
                                x = op_time,
                                event = state,
                                distribution = "lognormal",
                                seed = NULL,
                                details = FALSE)

# Example 2 - Detailed list output:
list_detail <- mcs_delay_report(date_repair = date_of_repair,
                                date_report = date_of_report,
                                x = op_time,
                                event = state,
                                distribution = "lognormal",
                                seed = NULL,
                                details = TRUE)



