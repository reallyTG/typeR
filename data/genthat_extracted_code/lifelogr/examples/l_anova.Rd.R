library(lifelogr)


### Name: l_anova
### Title: ANOVA test to assess impact of all variables (together) upon
###   each measure
### Aliases: l_anova

### ** Examples

data(EX)

dataset <- create_dataset(person = EX,
                          all_variables = list("util" = c("day_of_week"), 
                     "fitbit_daily" = c("sleepDuration", 
                                        "steps",
                                        "restingHeartRate")),
                                         time_var = c("date"))
all_anovas <- l_anova(dataset, person = EX, variables = list("util" = c("day_of_week"), 
                                               "fitbit_daily" = c("sleepDuration",
                                               "steps")),
                      measures = list("fitbit_daily" = c("restingHeartRate")))
       



