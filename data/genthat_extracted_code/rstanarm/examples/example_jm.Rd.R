library(rstanarm)


### Name: example_jm
### Title: Example joint longitudinal and time-to-event model
### Aliases: example_jm

### ** Examples

  set.seed(123)
  example_jm <- 
     stan_jm(formulaLong = logBili ~ year + (1 | id), 
             dataLong = pbcLong[1:101,],
             formulaEvent = survival::Surv(futimeYears, death) ~ sex + trt, 
             dataEvent = pbcSurv[1:15,],
             time_var = "year",
             # this next line is only to keep the example small in size!
             chains = 1, seed = 12345, iter = 200, refresh = 0)





