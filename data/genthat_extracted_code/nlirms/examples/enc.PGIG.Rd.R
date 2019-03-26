library(nlirms)


### Name: enc.PGIG
### Title: Expected number of claims based on the Poisson-Generalized
###   Inverse Gaussian (Sichel) model.
### Aliases: PGIG dPGIG enc.PGIG

### ** Examples

time=1:5
claim=0:4
# Expected number of claims based on the Poisson-Generalized Inverse Gaussian model
enc.PGIG(time = time, claim = claim, mu = .1, sigma = 2, nu=1)

# Expected number of claims based on the Poisson-Inverse Gaussian model
enc.PGIG(time = time, claim = claim, mu = .1, sigma = 2, nu=-.5)

# Expected number of claims based on the Poisson-Harmonic model
enc.PGIG(time = time, claim = claim, mu = .1, sigma = 2, nu=0)



