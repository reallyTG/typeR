library(epinet)


### Name: epi2newick
### Title: Prints a transmission tree in Newick format.
### Aliases: epi2newick epi2newickmcmc
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
    beta = 0.3, ki = 2, thetai = 5, latencydist="gamma")
cat(epi2newick(exampleepidemic))

## Not run: 
##D # Build covariates
##D set.seed(1)
##D N <- 50
##D mycov <- data.frame(id = 1:N, xpos = runif(N), ypos = runif(N))
##D dyadCov <- BuildX(mycov,binaryCol = list(c(2, 3)),binaryFunc = c("euclidean"))
##D # Build network
##D eta <- c(0, -7)
##D net <- SimulateDyadicLinearERGM(N = N,dyadiccovmat = dyadCov,eta = eta)
##D # Simulate epidemic
##D epi <- SEIR.simulator(M=net,N=N,beta=1,ki=3,thetai=7,ke=3,latencydist="gamma")
##D # Run MCMC routine on simulated epidemic
##D mcmcinput <- MCMCcontrol(nsamp = 1000000, thinning = 100, etapropsd = c(1, 1))
##D priors <- priorcontrol(bprior = c(0, 4), tiprior = c(1, 15), teprior = c(1, 15), 
##D 	etaprior = c(0, 10, 0, 10), kiprior = c(1, 7), keprior = c(1, 7), priordists = "uniform")
##D out <- epinet(~ xpos.ypos.L2Dist, epidata = epi, dyadiccovmat = dyadCov,
##D 	mcmcinput = mcmcinput, priors = priors)
##D cat(epi2newickmcmc(out))
## End(Not run)



