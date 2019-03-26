library(BayesLCA)


### Name: blca.gibbs
### Title: Bayesian Latent Class Analysis via Gibbs Sampling
### Aliases: blca.gibbs
### Keywords: blca gibbs

### ** Examples

## Generate a 4-dim. sample with 2 latent classes of 500 data points each.
## The probabilities for the 2 classes are given by type1 and type2.

type1 <- c(0.8, 0.8, 0.2, 0.2)
type2 <- c(0.2, 0.2, 0.8, 0.8)
x<- rlca(1000, rbind(type1,type2), c(0.6,0.4))

## Not run: fit.gibbs<-blca.gibbs(x,2, iter=1000, burn.in=10)
## Not run: summary(fit.gibbs)
## Not run: plot(fit.gibbs)
## Not run: raftery.diag(as.mcmc(fit.gibbs))


## Not run: fit.gibbs<-blca.gibbs(x,2, iter=10000, burn.in=100, thin=0.5) 
## Not run: plot(fit.gibbs, which=4)
## Not run: raftery.diag(as.mcmc(fit.gibbs))




