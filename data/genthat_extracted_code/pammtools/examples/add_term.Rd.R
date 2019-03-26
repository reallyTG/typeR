library(pammtools)


### Name: add_term
### Title: Add the contribution of a term to the linear predictor to data
###   set
### Aliases: add_term

### ** Examples

ped <- tumor[1:50,] %>% as_ped(Surv(days, status)~ age)
pam <- mgcv::gam(ped_status ~ s(tend)+age, data = ped, family=poisson(), offset=offset)
ped_info(ped) %>% add_term(pam, term="tend")



