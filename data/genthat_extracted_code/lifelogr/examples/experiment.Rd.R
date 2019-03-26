library(lifelogr)


### Name: experiment
### Title: Do the specified analysis of the impact of the variables on the
###   measure
### Aliases: experiment

### ** Examples

data(EX)
experiment(person = EX, variables = list("fitbit_daily" = c("sleepDuration"),
                                         "util" = c("day_of_week")),
                        measures = list("fitbit_daily" = 
                                          c("restingHeartRate")),
                        analysis = c("plot"), time_var = c("date"))




