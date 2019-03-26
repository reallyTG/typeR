library(weibulltools)


### Name: dist_delay_report
### Title: Parameter Estimation of the Delay in Report Distribution
### Aliases: dist_delay_report

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

params_delay_report  <- dist_delay_report(date_repair = date_of_repair,
                                            date_report = date_of_report,
                                            distribution = "lognormal")



