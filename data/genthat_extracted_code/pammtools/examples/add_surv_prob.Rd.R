library(pammtools)


### Name: add_surv_prob
### Title: Add survival probability estimates
### Aliases: add_surv_prob

### ** Examples

ped <- tumor[1:50,] %>% as_ped(Surv(days, status)~ age)
pam <- mgcv::gam(ped_status ~ s(tend)+age, data=ped, family=poisson(), offset=offset)
ped_info(ped) %>% add_surv_prob(pam, ci=TRUE)



