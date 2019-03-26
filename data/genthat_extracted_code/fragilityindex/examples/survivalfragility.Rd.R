library(fragilityindex)


### Name: survivalfragility
### Title: Survival Fragility Function
### Aliases: survivalfragility

### ** Examples

library(survival); data <- lung
data$status = lung$status - 1 # recode status as a 0/1 variable

survivalfragility(Surv(time, status) ~ pat.karno + strata(inst),
                  data, covariate = "pat.karno")

survivalfragility(Surv(time, status) ~ pat.karno + ph.karno + strata(inst),
                  data, verbose = TRUE)
                  #algorithm does not converge for strata(inst)

survivalfragility(Surv(time, status) ~ pat.karno + ph.karno + strata(inst),
                  data, covariate = c("pat.karno","ph.karno"))





