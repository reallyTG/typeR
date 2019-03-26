library(pammtools)


### Name: ped_info
### Title: Extract interval information and median/modus values for
###   covariates
### Aliases: ped_info

### ** Examples

ped <- tumor[1:4,] %>% as_ped(Surv(days, status)~ sex + age)
ped_info(ped)



