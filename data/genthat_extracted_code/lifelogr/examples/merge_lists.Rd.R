library(lifelogr)


### Name: merge_lists
### Title: Merge a list of lists into one list
### Aliases: merge_lists

### ** Examples

variables = list("fitbit_intraday" = c("steps"), 
                "fitbit_daily" = c("sleepDuration"),
                "util" = c("day_of_week", "day_type", "month"))
measures = list("fitbit_daily" = c("distance", "restingHeartRate"))
all_variables <- merge_lists(list(variables, measures))




