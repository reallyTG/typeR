library(BayesFM)


### Name: simul.R.prior
### Title: Simulate prior distribution of factor correlation matrix
### Aliases: simul.R.prior

### ** Examples

# reproduce figure 1 in CFSHP (p.38)
# note: use larger number of replications nrep to increase smoothness
Kmax <- 20
Rsim <- simul.R.prior(Kmax, nu0 = Kmax + c(1, 2, 5, 10), S0 = .5, nrep = 1e3)
summary(Rsim)
plot(Rsim)




