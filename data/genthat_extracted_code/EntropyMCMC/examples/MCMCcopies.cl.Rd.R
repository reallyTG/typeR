library(EntropyMCMC)


### Name: MCMCcopies.cl
### Title: Parallel simulation of iid copies of a MCMC algorithm - cluster
###   versions
### Aliases: MCMCcopies.cl
### Keywords: file

### ** Examples

## Toy example using the bivariate gaussian target
## No test: 
n = 150; nmc = 20; d=2 # bivariate example
varq=0.1 # variance of the proposal (chosen too small)
q_param=list(mean=rep(0,d),v=varq*diag(d))
## initial distribution, located in (2,2), "far" from target center (0,0)
Ptheta0 <- DrawInit(nmc, d, initpdf = "rnorm", mean = 2, sd = 1) 
# simulations (may be compared with the singlecore version using system.time)
s1 <- MCMCcopies.cl(RWHM, n, nmc, Ptheta0, target_norm,
		              target_norm_param, q_param, nbnodes = 2)
summary(s1) # method for "plMCMC" object
  
## End(No test)
## see MCMCcopies example for plots



