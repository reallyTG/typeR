library(EntropyMCMC)


### Name: EntropyParallel
### Title: Parallel simulation and Entropy estimation of MCMC's - single
###   core and cluster versions
### Aliases: EntropyParallel EntropyParallel.cl
### Keywords: file

### ** Examples

## Toy example using the bivariate gaussian target
## same as for MCMCcopies
n = 150; nmc = 50; d=2 # bivariate example
varq=0.1 # variance of the proposal (chosen too small)
q_param=list(mean=rep(0,d),v=varq*diag(d))
## initial distribution, located in (2,2), "far" from target center (0,0)
Ptheta0 <- DrawInit(nmc, d, initpdf = "rnorm", mean = 2, sd = 1) 
# simulations and entropy + Kullback using the singlecore version
e1 <- EntropyParallel(RWHM, n, nmc, Ptheta0, target_norm,
                target_norm_param, q_param, verb = FALSE)
par(mfrow=c(1,2))
plot(e1) # default plot.plMCMC method, convergence after about 80 iterations
plot(e1, Kullback = FALSE) # Plot Entropy estimates over time
abline(normEntropy(target_norm_param), 0, col=8, lty=2) # true E_f[log(f)]
## No test: 
# Another example using multicore version, (not available on Windows)
varq=0.05 # variance of the proposal, even smaller
q_param=list(mean=rep(0,d),v=varq*diag(d))
n=300 # requires more iterations to show convergence
e1 <- EntropyParallel.cl(RWHM, n, nmc, Ptheta0, target_norm,
                         target_norm_param, q_param, cltype="PAR_SOCK",
                         verb = FALSE, nbnodes = 2)
plot(e1) # convergence after about 150 iterations
  
## End(No test)



