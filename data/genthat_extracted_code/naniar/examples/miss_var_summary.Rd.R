library(naniar)


### Name: miss_var_summary
### Title: Summarise the missingness in each variable
### Aliases: miss_var_summary

### ** Examples


miss_var_summary(airquality)
miss_var_summary(oceanbuoys, order = TRUE)

# works with group_by from dplyr
library(dplyr)
airquality %>%
  group_by(Month) %>%
  miss_var_summary()




