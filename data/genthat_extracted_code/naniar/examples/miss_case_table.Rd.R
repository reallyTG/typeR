library(naniar)


### Name: miss_case_table
### Title: Tabulate missings in cases.
### Aliases: miss_case_table

### ** Examples


miss_case_table(airquality)
library(dplyr)
airquality %>%
  group_by(Month) %>%
  miss_case_table()




