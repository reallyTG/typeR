library(pammtools)


### Name: add_hazard
### Title: Add predicted (cumulative) hazard to data set
### Aliases: add_hazard add_cumu_hazard

### ** Examples

ped <- tumor[1:50,] %>% as_ped(Surv(days, status)~ age)
pam <- mgcv::gam(ped_status ~ s(tend)+age, data = ped, family=poisson(), offset=offset)
ped_info(ped) %>% add_hazard(pam, type="link")
ped_info(ped) %>% add_hazard(pam, type = "response")
ped_info(ped) %>% add_cumu_hazard(pam)



