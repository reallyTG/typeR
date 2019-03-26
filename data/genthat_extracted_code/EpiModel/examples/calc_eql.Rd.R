library(EpiModel)


### Name: calc_eql
### Title: Calculate Equilibrium for Infection Prevalence
### Aliases: calc_eql

### ** Examples

# Calculate equilibrium for a DCM
param <- param.dcm(inf.prob = 0.2, inf.prob.g2 = 0.1, act.rate = 0.5,
                   balance = "g1", rec.rate = 1 / 50, rec.rate.g2 = 1 / 50,
                   a.rate = 1 / 100, a.rate.g2 = NA, ds.rate = 1 / 100,
                   ds.rate.g2 = 1 / 100, di.rate = 1 / 90,
                   di.rate.g2 = 1 / 90)
init <- init.dcm(s.num = 500, i.num = 1,
                 s.num.g2 = 500, i.num.g2 = 1)
control <- control.dcm(type = "SIS", nsteps = 500, verbose = FALSE)
x <- dcm(param, init, control)
plot(x)

# Different calculation options
calc_eql(x, nsteps = 100)
calc_eql(x, nsteps = 250)
calc_eql(x, nsteps = 100, numer = "i.num.g2", denom = "num.g2")
calc_eql(x, nsteps = 100, numer = "i.num.g2", denom = "num.g2",
         threshold = 0.00001)




