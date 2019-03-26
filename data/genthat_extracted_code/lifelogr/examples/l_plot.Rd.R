library(lifelogr)


### Name: l_plot
### Title: Plot each variable vs each measure of interest
### Aliases: l_plot

### ** Examples

data(EX)

l_plot(person = EX, variables = list("fitbit_daily" = c("sleepDuration",
                                                        "steps", "distance"),
                                     "util" = c("day_of_week", "day_type")), 
       measures = list("fitbit_daily" = c("restingHeartRate")),
       time_var = c("date"))

dataset <- create_dataset(person = EX, all_variables = list(
                                               "util" = c("month"),
                                               "fitbit_daily" = c("steps")),
                                       time_var = c("date"))
                                       
l_plot(dataset, person = EX, variables = list("util" = c("month")),
       measures = list("fitbit_daily" = c("steps")))
       
       



