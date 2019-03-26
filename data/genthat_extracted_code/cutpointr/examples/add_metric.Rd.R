library(cutpointr)


### Name: add_metric
### Title: Add metrics to a cutpointr object
### Aliases: add_metric

### ** Examples

library(dplyr)
library(cutpointr)
cutpointr(suicide, dsi, suicide, gender) %>%
  add_metric(list(ppv, npv)) %>%
  select(optimal_cutpoint, subgroup, AUC, sum_sens_spec, ppv, npv)



