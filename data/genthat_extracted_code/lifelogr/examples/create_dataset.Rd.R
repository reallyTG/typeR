library(lifelogr)


### Name: create_dataset
### Title: Creates a dataset across data sources in a Person object
### Aliases: create_dataset

### ** Examples

data(EX)
dataset <- create_dataset(person = EX,
                          all_variables = list("util" = c("month"),
                                               "fitbit_daily" = c("steps")),
                          time_var = c("date"))




