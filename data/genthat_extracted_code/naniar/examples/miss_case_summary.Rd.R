library(naniar)


### Name: miss_case_summary
### Title: Summarise the missingness in each case
### Aliases: miss_case_summary

### ** Examples


# works with group_by from dplyr
library(dplyr)
airquality %>%
  group_by(Month) %>%
  miss_case_summary()

miss_case_summary(airquality)




