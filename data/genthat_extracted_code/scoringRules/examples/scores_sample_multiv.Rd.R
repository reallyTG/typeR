library(scoringRules)


### Name: scores_sample_multiv
### Title: Multivariate Scoring Rules for Simulated Forecast Distributions
### Aliases: scores_sample_multiv es_sample vs_sample

### ** Examples

d <- 10  # number of dimensions
m <- 50  # number of samples from multivariate forecast distribution

mu0 <- rep(0, d)
mu <- rep(1, d)
S0 <- S <- diag(d)
S[S==0] <- 0.1
S0[S0==0] <- 0.2

# generate samples from multivariate normal distributions
obs <- drop(mu0 + rnorm(d) %*% chol(S0))
fc_sample <- replicate(m, drop(mu + rnorm(d) %*% chol(S)))

es_sample(y = obs, dat = fc_sample)

# weighting matrix for variogram score
w_vs <- matrix(NA, nrow = d, ncol = d)
for(d1 in 1:d){for(d2 in 1:d){w_vs[d1,d2] <- 0.5^abs(d1-d2)}}

vs_sample(y = obs, dat = fc_sample) 
vs_sample(y = obs, dat = fc_sample, w = w_vs) 
vs_sample(y = obs, dat = fc_sample, w = w_vs, p = 1)




