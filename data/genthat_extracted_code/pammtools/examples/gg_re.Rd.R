library(pammtools)


### Name: gg_re
### Title: Plot Normal QQ plots for random effects
### Aliases: gg_re

### ** Examples

data("lung", package="survival")
lung$inst <- as.factor(lung$inst) # for mgcv
ped <- lung %>% as_ped(Surv(time, status)~ph.ecog + inst, id="id")
pam <- mgcv::gam(ped_status ~ s(tend) + ph.ecog + s(inst, bs="re"),
 data=ped, family=poisson(), offset=offset)
gg_re(pam)



