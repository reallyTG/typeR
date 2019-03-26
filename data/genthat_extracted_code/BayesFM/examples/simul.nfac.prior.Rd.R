library(BayesFM)


### Name: simul.nfac.prior
### Title: Simulate prior distribution of number of latent factors
### Aliases: simul.nfac.prior

### ** Examples

# replicate first row of table 2 in CFSHP (p.44)
# note: use larger number of replications nrep to improve accuracy
prior.nfac <- simul.nfac.prior(nvar = 15, Kmax = 5, kappa = c(.3, .7, 1))
summary(prior.nfac)
plot(prior.nfac)




