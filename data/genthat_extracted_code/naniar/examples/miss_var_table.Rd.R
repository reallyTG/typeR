library(naniar)


### Name: miss_var_table
### Title: Tabulate the missings in the variables
### Aliases: miss_var_table

### ** Examples


miss_var_table(airquality)

library(dplyr)
airquality %>%
  group_by(Month) %>%
  miss_var_table()




