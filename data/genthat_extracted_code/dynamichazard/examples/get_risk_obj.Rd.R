library(dynamichazard)


### Name: get_risk_obj
### Title: Risk Set on an Equidistant Distant Grid
### Aliases: get_risk_obj

### ** Examples

# small toy example with time-varying covariates
dat <- data.frame(
 id     = c(1, 1, 2, 2),
 tstart = c(0, 4, 0, 2),
 tstop  = c(4, 6, 2, 4),
 event  = c(0, 1, 0, 0))

with(dat, get_risk_obj(Surv(tstart, tstop, event), by = 1, max_T = 6, id = id))




