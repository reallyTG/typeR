library(VineCopula)


### Name: BiCopCondSim
### Title: Conditional simulation from a Bivariate Copula
### Aliases: BiCopCondSim

### ** Examples

# create bivariate t-copula
obj <- BiCop(family = 2, par = -0.7, par2 = 4)

# simulate 500 observations of (U1, U2)
sim <- BiCopSim(500, obj)
hist(sim[, 1])  # data have uniform distribution
hist(sim[, 2])  # data have uniform distribution

# simulate 500 observations of (U2 | U1 = 0.7)
sim1 <- BiCopCondSim(500, cond.val = 0.7, cond.var = 1, obj)
hist(sim1)  # not uniform!

# simulate 500 observations of (U1 | U2 = 0.1)
sim2 <- BiCopCondSim(500, cond.val = 0.1, cond.var = 2, obj)
hist(sim2)  # not uniform!




