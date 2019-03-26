library(lifelogr)


### Name: correlation
### Title: Correlation between each variable vs each measure
### Aliases: correlation

### ** Examples

data(EX)

dataset <- create_dataset(person = EX, 
            all_variables = list("fitbit_daily" = c("sleepDuration", 
                                                    "steps")),
            time_var = c("date"))
                      
correlation_df <- correlation(dataset, person = EX, 
                            variables = list("fitbit_daily" = 
                                                 c("sleepDuration")),
                            measures = list("fitbit_daily" = c("steps")),
                           time_var = "date")
       
      



