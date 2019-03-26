library(jstable)


### Name: TableSubgroupCox
### Title: TableSubgroupCox: Sub-group analysis table for Cox/svycox model.
### Aliases: TableSubgroupCox

### ** Examples

library(survival);library(dplyr)
lung %>% 
  mutate(status = as.integer(status == 1),
         sex = factor(sex),
         kk = factor(as.integer(pat.karno >= 70))) -> lung
TableSubgroupCox(Surv(time, status) ~ sex, data = lung, time_eventrate = 100)
TableSubgroupCox(Surv(time, status) ~ sex, var_subgroup = "kk", data = lung, 
                 time_eventrate = 100)

## survey design
library(survey)
data.design <- svydesign(id = ~1, data = lung)
TableSubgroupCox(Surv(time, status) ~ sex, data = data.design, time_eventrate = 100)
TableSubgroupCox(Surv(time, status) ~ sex, var_subgroup = "kk", data = data.design,
                 time_eventrate = 100)



