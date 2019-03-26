library(EntropyMCMC)


### Name: MCMCcopies
### Title: Simulates iid copies of a MCMC algorithm
### Aliases: MCMCcopies
### Keywords: file

### ** Examples

## Toy example using the bivariate gaussian target
## with default parameters value, see target_norm_param
n = 150; nmc = 20; d=2 # bivariate example
varq=0.1 # variance of the proposal (chosen too small)
q_param=list(mean=rep(0,d),v=varq*diag(d))
## initial distribution, located in (2,2), "far" from target center (0,0)
Ptheta0 <- DrawInit(nmc, d, initpdf = "rnorm", mean = 2, sd = 1) 
# simulation
s1 <- MCMCcopies(RWHM, n, nmc, Ptheta0, target_norm,
                 target_norm_param, q_param, verb = FALSE)
summary(s1) # method for "plMCMC" object
par(mfrow=c(1,2))
plot(s1) # just a path of the iid chains, method for "plMCMC" object
hist(s1$Ptheta[,1,], col=8) # marginal 1



