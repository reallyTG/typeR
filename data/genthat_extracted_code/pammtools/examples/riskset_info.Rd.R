library(pammtools)


### Name: riskset_info
### Title: Extract risk set information for each interval.
### Aliases: riskset_info
### Keywords: internal

### ** Examples

ped <- tumor[1:4,] %>% as_ped(Surv(days, status)~ .)
riskset_info(ped)



