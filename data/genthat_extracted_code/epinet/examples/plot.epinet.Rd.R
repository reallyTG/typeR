library(epinet)


### Name: plot.epinet
### Title: Plot the spread of an epidemic
### Aliases: plot.epinet
### Keywords: graphs

### ** Examples
# Simulate an epidemic through a network of 30
set.seed(3)
N <- 30
# Build dyadic covariate matrix (X)
# Have a single covariate for overall edge density; this is the Erdos-Renyi model
nodecov <- matrix(1:N, nrow = N)
dcm <- BuildX(nodecov)
# Simulate network and then simulate epidemic over network
examplenet <- SimulateDyadicLinearERGM(N, dyadiccovmat = dcm, eta = -1.8)
exampleepidemic <- SEIR.simulator(examplenet, N = 30, 
    beta = 0.3, ki = 2, thetai = 5, latencydist = "gamma")

# Set inputs for MCMC algorithm
mcmcinput <- MCMCcontrol(nsamp = 5000, thinning = 10, extrathinning = 10, 
    etapropsd = 0.2) 
priorcontrol <- priorcontrol(bprior = c(0, 1), tiprior = c(1, 3), teprior = c(1, 3), 
    etaprior = c(0, 10), kiprior = c(2, 8), keprior = c(2, 8), priordists = "uniform")
# Run MCMC algorithm on this epidemic
# Delete Exposure and Infection times; will infer these in the MCMC algorithm
exampleepidemic[, 3:4] <- NA
examplemcmc <- epinet( ~ 1, exampleepidemic, dcm, mcmcinput, priorcontrol,
     verbose = FALSE)

# Plot starting state of epidemic from chain 
plot(examplemcmc, index = 1)

# Plot final state of epidemic from chain 
plot(examplemcmc)



