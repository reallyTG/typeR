library(BayesLCA)


### Name: summary.blca
### Title: Bayesian Latent Class Analysis
### Aliases: summary.blca summary.blca.boot summary.blca.em
###   summary.blca.gibbs summary.blca.vb print.summary.blca
### Keywords: summary blca

### ** Examples

data(Alzheimer)
summary(blca.em(Alzheimer, 2))
summary(blca.vb(Alzheimer, 2, alpha=2, beta=2, delta=0.5))

## Not run: (fit.gibbs)<- blca.gibbs(Alzheimer, 2, delta=2)
## Not run: summary(fit.gibbs)



