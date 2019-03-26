library(dynamichazard)


### Name: get_survival_case_weights_and_data
### Title: Get data.frame for Discrete Time Survival Models
### Aliases: get_survival_case_weights_and_data

### ** Examples

library(dynamichazard)
# small toy example with time-varying covariates
dat <- data.frame(
 id     = c(   1,    1, 2,     2),
 tstart = c(   0,    4, 0,     2),
 tstop  = c(   4,    6, 2,     6),
 event  = c(   0,    1, 0,     0),
 x1     = c(1.09, 1.29, 0, -1.16))

get_survival_case_weights_and_data(
 Surv(tstart, tstop, event) ~ x1, dat, by = 1, id = dat$id)$X
get_survival_case_weights_and_data(
 Surv(tstart, tstop, event) ~ x1, dat, by = 1, id = dat$id,
 use_weights = FALSE)$X




