library(EntropyMCMC)


### Name: EntropyMCMC
### Title: Kullback and entropy estimation from MCMC simulation output -
###   single and multicore versions
### Aliases: EntropyMCMC EntropyMCMC.mc
### Keywords: file

### ** Examples

## Toy example using the bivariate gaussian target
## with default parameters value, see target_norm_param
n = 150; nmc = 50; d=2 # bivariate example
varq=0.1 # variance of the proposal (chosen too small)
q_param=list(mean=rep(0,d),v=varq*diag(d))
## initial distribution, located in (2,2), "far" from target center (0,0)
Ptheta0 <- DrawInit(nmc, d, initpdf = "rnorm", mean = 2, sd = 1) 
# simulation of the nmc iid chains, singlecore 
s1 <- MCMCcopies(RWHM, n, nmc, Ptheta0, target_norm,
                 target_norm_param, q_param, verb = FALSE)
summary(s1) # method for "plMCMC" object
e1 <- EntropyMCMC(s1) # computes Entropy and Kullback divergence estimates
par(mfrow=c(1,2))
plot(e1) # default plot.plMCMC method, convergence after about 80 iterations
plot(e1, Kullback = FALSE) # Plot Entropy estimates over time
abline(normEntropy(target_norm_param), 0, col=8, lty=2) # true E_f[log(f)]



