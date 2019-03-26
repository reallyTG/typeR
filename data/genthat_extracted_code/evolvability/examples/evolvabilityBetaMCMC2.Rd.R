library(evolvability)


### Name: evolvabilityBetaMCMC2
### Title: Calculate posterior distribution of evolvability parameters from
###   a selection gradient with uncertainty
### Aliases: evolvabilityBetaMCMC2 print.evolvabilityBetaMCMC2
### Keywords: array algebra multivariate

### ** Examples

# Simulating a posterior distribution 
# (or bootstrap distribution) of a G-matrix:
G = matrix(c(1, 1, 0, 1, 4, 1, 0, 1, 2), ncol = 3)
G_mcmc = sapply(c(G), function(x) rnorm(10, x, 0.01)) 
G_mcmc = t(apply(G_mcmc, 1, function(x){
  G = matrix(x, ncol=sqrt(length(x)))
  G[lower.tri(G)] = t(G)[lower.tri(G)]
  c(G)
}))

# Simulating a posterior distribution 
# (or bootstrap distribution) of trait means:
means = c(1, 1.4, 2.1)
means_mcmc = sapply(means, function(x) rnorm(10, x, 0.01)) 

# Mean standardizing the G-matrix:
G_mcmc = meanStdGMCMC(G_mcmc, means_mcmc)

# Simulating a posterior distribution (or bootstrap distribution) 
# of a unit length selection gradient:
Beta = randomBeta(1, 3)
Beta.mcmc = sapply(c(Beta), function(x) rnorm(10, x, 0.01))
Beta.mcmc = t(apply(Beta.mcmc, 1, function(x) x/sqrt(sum(x^2))))

# Running the model:
evolvabilityBetaMCMC2(G_mcmc, Beta_mcmc = Beta.mcmc, post.dist=TRUE)



