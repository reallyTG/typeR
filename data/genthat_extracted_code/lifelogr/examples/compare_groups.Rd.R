library(lifelogr)


### Name: compare_groups
### Title: Prints statistics on dataset, grouped by group assignments
### Aliases: compare_groups

### ** Examples

data(EX)

dataset <- create_dataset(person = EX, all_variables = list("util" = c("month"), 
                                  "fitbit_daily" = c("sleepDuration", "steps",
                                  "restingHeartRate")), time_var = c("date"))
                                  
indiv_months <- data.frame("month"= c("Jan", "Feb", "Mar", "Apr", "May",
                                      "Jun", "Jul", "Aug", "Sep", "Oct", 
                                      "Nov", "Dec"),
                           "group" = c(1:12))
compare_groups(dataset, person = EX, 
            addl_grouping_assignments = list("indiv_months" = indiv_months), 
            names_of_groupings = c("indiv_months"),
            variables_to_compare = c("steps", "restingHeartRate"))

       



