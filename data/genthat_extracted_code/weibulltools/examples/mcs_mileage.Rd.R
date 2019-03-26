library(weibulltools)


### Name: mcs_mileage
### Title: Estimation of Driving Distances for Censored Observations using
###   a Monte Carlo Approach
### Aliases: mcs_mileage

### ** Examples

# Example 1 - Simplified vector output (complete data):
date_of_registration <- c("2014-08-17", "2014-03-29", "2014-12-06",
                          "2014-09-09", "2014-05-14", "2014-07-01",
                          "2014-06-16", "2014-04-03", "2014-05-23",
                          "2014-05-09", "2014-05-31", "2014-08-12",
                          "2014-04-13", "2014-02-15", "2014-07-07",
                          "2014-03-12", "2014-05-27", "2014-06-02",
                          "2014-05-20", "2014-03-21", "2014-06-19",
                          "2014-02-12", "2014-03-27")
date_of_repair <- c("2014-10-21", "2014-09-15", "2015-07-04", "2015-04-10",
                    "2015-02-15", "2015-04-14", "2015-04-24", "2015-02-27",
                    "2015-04-25", "2015-04-24", "2015-06-12", "2015-08-26",
                    "2015-05-04", "2015-04-04", "2015-09-06", "2015-05-22",
                    "2015-08-21", "2015-09-17", "2015-09-15", "2015-08-15",
                    "2015-11-26", "2015-08-22", "2015-10-05")

op_time <- as.numeric(difftime(as.Date(date_of_repair),
                               as.Date(date_of_registration),
                               units = "days"))
mileage <- c(5227, 15655, 13629, 18292, 24291, 34455, 33555, 21659, 21737,
             29870, 21068, 22986, 122283, 31592, 49050, 36088, 10918, 11153,
             122437, 122842, 20349, 65656, 40777)
state <- sample(c(0, 1), size = length(op_time), replace = TRUE)

mileage_corrected <- mcs_mileage(x = op_time, event = state,
                                 mileage = mileage,
                                 distribution = "lognormal", seed = NULL,
                                 details = FALSE)

# Example 2 - Detailed list output (complete data):
list_detail <- mcs_mileage(x = op_time, event = state, mileage = mileage,
                               distribution = "lognormal", seed = NULL,
                               details = TRUE)

# Example 3 - Detailed list output (realistic example):
op_time <- c(65, 170, 210, 213, 277, 287, 312, 330, 337, 350, 377, 379, 386,
             413, 426, 436, 451, 472, 483, 512, 525, 556, 557)
mileage <- c(NA, 15655, 13629, NA, 24291, 34455, NA, 21659, 21737,
             NA, 21068, 22986, NA, 31592, 49050, NA, 10918, 11153,
             NA, 122842, 20349, NA, 40777)
state <- c(0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0, 1, 1, 0,
           1, 1, 0, 1)

list_detail <- mcs_mileage(x = op_time, event = state, mileage = mileage,
                               distribution = "lognormal", seed = NULL,
                               details = TRUE)



