library(PhaseType)


### Name: PhaseType-package
### Title: Phase-type Distributions Toolbox
### Aliases: PhaseType-package PhaseType
### Keywords: phase-type pht mcmc

### ** Examples

library(actuar)
# Define the S matrix (columnwise)
S <- matrix(c(-3.6, 9.5, 9.5, 1.8, -11.3, 0, 1.8, 0, -11.3), 3)

# Define starting state distribution
pi <- c(1, 0, 0)

# Generate 50 random absorption times from the Phase-type with subgenerator S
# and starting distribution pi, which we will try to infer next
x <- rphtype(50, pi, S)


library(PhaseType)
# FIRST: descriptive model fit (Bladt et al. 2003)
# Prior on starting state
dirpi <- c(1, 0, 0)

# Gamma prior: shape hyperparameters (one per matrix element, columnwise)
nu <- c(24, 24, 1, 180, 1, 24, 180, 1, 24)

# Gamma prior: reciprocal scale hyperparameters (one per matrix row)
zeta <- c(16, 16, 16)

# Define dimension of model to fit
n <- 3

# Perform 20 MCMC iterations (fix inner Metropolis-Hastings to one iteration
# since starts in stationarity here).  Do more in practise!!
res1 <- phtMCMC(x, n, dirpi, nu, zeta, 20, mhit=1)
print(res1)
plot(res1)


# SECOND: mechanistic model fit (Aslett and Wilson 2011)
# Prior on starting state
dirpi <- c(1, 0, 0)

# Define the structure of the Phase-type generator
T <- matrix(c(0,"R","R",0,"F",0,0,0,"F",0,0,0,0,"F","F",0), 4)

# Gamma prior: shape hyperparameters (one per model parameter)
nu <- list("R"=180, "F"=24)

# Gamma prior: reciprocal scale hyperparameters (one per model parameter)
zeta <- c("R"=16,"F"=16)

# Perform 20 MCMC iterations.  Do more in practise!!
res2 <- phtMCMC2(x, T, dirpi, nu, zeta, 20)
print(res2)
plot(res2)



