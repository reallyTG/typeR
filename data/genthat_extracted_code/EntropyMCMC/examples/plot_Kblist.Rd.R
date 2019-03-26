library(EntropyMCMC)


### Name: plot_Kblist
### Title: Plot sequences of Kullback distance estimates for comparison of
###   several MCMC algorithms for a same target density
### Aliases: plot_Kblist
### Keywords: file

### ** Examples

## No test: 
## Toy example using the bivariate centered gaussian target
## with default parameters value, see target_norm_param
d = 2           # state space dimension
n=300; nmc=100  # number of iterations and iid Markov chains
## initial distribution, located in (2,2), "far" from target center (0,0)
Ptheta0 <- DrawInit(nmc, d, initpdf = "rnorm", mean = 2, sd = 1) 

## MCMC 1: Random-Walk Hasting-Metropolis
varq=0.05 # variance of the proposal (chosen too small)
q_param=list(mean=rep(0,d),v=varq*diag(d))

## using Method 1: simulation with storage, and *then* entropy estimation
# simulation of the nmc iid chains, single core here
s1 <- MCMCcopies(RWHM, n, nmc, Ptheta0, target_norm,
                 target_norm_param, q_param)
summary(s1) # method for "plMCMC" object
e1 <- EntropyMCMC(s1) # computes Entropy and Kullback divergence

## MCMC 2: Independence Sampler with large enough gaussian proposal
varq=1; q_param <- list(mean=rep(0,d),v=varq*diag(d))

## using Method 2: simulation & estimation for each t, forgetting the past
## HPC with 2 cores here (using parallel socket cluser, not available on Windows machines)
e2 <- EntropyParallel.cl(HMIS_norm, n, nmc, Ptheta0, target_norm,
                      target_norm_param, q_param, 
                      cltype="PAR_SOCK", nbnodes=2)

## Compare these two MCMC algorithms
plot_Kblist(list(e1,e2)) # MCMC 2 (HMIS, red plot) converges faster.
  
## End(No test)



