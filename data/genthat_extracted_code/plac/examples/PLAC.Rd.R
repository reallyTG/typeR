library(plac)


### Name: PLAC
### Title: Calculate the PLAC estimator when a time-dependent indicator
###   presents
### Aliases: PLAC

### ** Examples

# When only time-invariant covariates are involved
dat1 = sim.ltrc(n = 50)$dat
PLAC(ltrc.formula = Surv(As, Ys, Ds) ~ Z1 + Z2,
     ltrc.data = dat1, td.type = "none")
# When there is a time-dependent covariate that is independent of the truncation time
dat2 = sim.ltrc(n = 50, time.dep = TRUE,
               distr.A = "binomial", p.A = 0.8, Cmax = 5)$dat
PLAC(ltrc.formula = Surv(As, Ys, Ds) ~ Z,
     ltrc.data = dat2, td.type = "independent",
     td.var = "Zv", t.jump = "zeta")
# When there is a time-dependent covariate that depends on the truncation time
dat3 = sim.ltrc(n = 50, time.dep = TRUE, Zv.depA = TRUE, Cmax = 5)$dat
PLAC(ltrc.formula = Surv(As, Ys, Ds) ~ Z,
     ltrc.data = dat3, td.type = "post-trunc",
     td.var = "Zv", t.jump = "zeta")




