library(survminer)


### Name: surv_group_by
### Title: Create a Grouped Dataset for Survival Analysis
### Aliases: surv_group_by

### ** Examples

library("survival")
library("magrittr")

# Grouping by one variables: treatment "rx"
#::::::::::::::::::::::::::::::::::::::::::
grouped.d <- colon %>%
  surv_group_by("rx")

grouped.d # print

grouped.d$data # Access to the data

# Grouping by two variables
#::::::::::::::::::::::::::::::::::::::::::
grouped.d <- colon %>%
   surv_group_by(grouping.vars = c("rx", "adhere"))
   grouped.d




