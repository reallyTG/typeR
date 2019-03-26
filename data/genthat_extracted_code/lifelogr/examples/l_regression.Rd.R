library(lifelogr)


### Name: l_regression
### Title: Performs linear regression with all variables and interactions
###   upon each measure
### Aliases: l_regression

### ** Examples

data(EX)

dataset <- create_dataset(person = EX,
                          all_variables = list("util" = c("day_of_week"), 
                     "fitbit_daily" = c("sleepDuration", 
                                        "steps",
                                        "restingHeartRate")),
                                         time_var = c("date"))
all_models <- l_regression(dataset, person = EX, variables = list("util" = c("day_of_week"), 
                                               "fitbit_daily" = c("sleepDuration",
                                               "steps")),
                      measures = list("fitbit_daily" = c("restingHeartRate")))
       



