library(ESGtoolkit)


### Name: simshocks
### Title: Underlying gaussian shocks for risk factors' simulation.
### Aliases: simshocks

### ** Examples

# Number of risk factors
d <- 6

# Number of possible combinations of the risk factors
dd <- d*(d-1)/2

# Family : Gaussian copula for all
fam1 <- rep(1,dd)

# Correlation coefficients between the risk factors (d*(d-1)/2)
par1 <- c(0.2,0.69,0.73,0.22,-0.09,0.51,0.32,0.01,0.82,0.01,
        -0.2,-0.32,-0.19,-0.17,-0.06)


# Simulation of shocks for the 6 risk factors
simshocks(n = 10, horizon = 5, family = fam1, par = par1)


# Simulation of shocks for the 6 risk factors
# on a quarterly basis
simshocks(n = 10, frequency = "quarterly", horizon = 2, family = fam1,
par = par1)


# Simulation of shocks for the 6 risk factors simulation
# on a quarterly basis, with antithetic variates and moment matching.
s0 <- simshocks(n = 10, method = "hyb", horizon = 4,
family = fam1, par = par1)


s0[[2]]
colMeans(s0[[1]])
colMeans(s0[[5]])
apply(s0[[3]], 2, sd)
apply(s0[[4]], 2, sd)



