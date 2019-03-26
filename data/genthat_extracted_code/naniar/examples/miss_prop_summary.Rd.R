library(naniar)


### Name: miss_prop_summary
### Title: Proportions of missings in data, variables, and cases.
### Aliases: miss_prop_summary

### ** Examples


miss_prop_summary(airquality)
library(dplyr)
airquality %>% group_by(Month) %>% miss_prop_summary()




