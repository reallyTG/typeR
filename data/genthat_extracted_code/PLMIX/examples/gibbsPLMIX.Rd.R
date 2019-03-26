library(PLMIX)


### Name: gibbsPLMIX
### Title: Gibbs sampling for a Bayesian mixture of Plackett-Luce models
### Aliases: gibbsPLMIX

### ** Examples


data(d_carconf)
GIBBS <- gibbsPLMIX(pi_inv=d_carconf, K=ncol(d_carconf), G=3, n_iter=30, n_burn=10)
str(GIBBS)

# Get posterior samples of Plackett-Luce mixture parameters
GIBBS$P
GIBBS$W




