library(jstable)


### Name: TableSubgroupMultiCox
### Title: TableSubgroupMultiCox: Multiple sub-group analysis table for
###   Cox/svycox model.
### Aliases: TableSubgroupMultiCox

### ** Examples

library(survival);library(dplyr)
lung %>% 
  mutate(status = as.integer(status == 1),
         sex = factor(sex),
         kk = factor(as.integer(pat.karno >= 70)),
         kk1 = factor(as.integer(pat.karno >= 60))) -> lung
TableSubgroupMultiCox(Surv(time, status) ~ sex, var_subgroups = c("kk", "kk1"), 
                      data=lung, time_eventrate = 100, line = TRUE)

## survey design
library(survey)
data.design <- svydesign(id = ~1, data = lung)
TableSubgroupMultiCox(Surv(time, status) ~ sex, var_subgroups = c("kk", "kk1"), 
                      data = data.design, time_eventrate = 100)



