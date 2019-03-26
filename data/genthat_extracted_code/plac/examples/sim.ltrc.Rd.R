library(plac)


### Name: sim.ltrc
### Title: Generate left-truncated (and right-cencored) data from the Cox
###   model.
### Aliases: sim.ltrc

### ** Examples

# With time-invariant covariates only
sim1 = sim.ltrc(n = 100)
head(sim1$dat)
# With one time-dependent covariate
sim2 = sim.ltrc(n = 100, time.dep = TRUE,
         distr.A = "binomial", p.A = 0.8, Cmax = 5)
head(sim2$dat)
# With one time-dependent covariate with dependence on the truncation time
sim3 = sim.ltrc(n = 100, time.dep = TRUE, Zv.depA = TRUE, Cmax = 5)
head(sim3$dat)



