library(RBesT)


### Name: postmix
### Title: Conjugate Posterior Analysis
### Aliases: postmix postmix.betaMix postmix.normMix postmix.gammaMix

### ** Examples


# binary example with individual data (1=event,0=no event), uniform prior
prior.unif <- mixbeta(c(1, 1, 1))
data.indiv <- c(1,0,1,1,0,1)
posterior.indiv <- postmix(prior.unif, data.indiv) 
print(posterior.indiv)
# or with summary data (number of events and number of patients)
r <- sum(data.indiv); n <- length(data.indiv)
posterior.sum <- postmix(prior.unif, n=n, r=r)
print(posterior.sum)

# binary example with robust informative prior and conflicting data
prior.rob <- mixbeta(c(0.5,4,10),c(0.5,1,1))
posterior.rob <- postmix(prior.rob, n=20, r=18)
print(posterior.rob)

# normal example with individual data
sigma <- 88
prior.mean <- -49
prior.se <- sigma/sqrt(20)
prior <- mixnorm(c(1,prior.mean,prior.se),sigma=sigma)
data.indiv <- c(-46,-227,41,-65,-103,-22,7,-169,-69,90)
posterior.indiv <- postmix(prior, data.indiv)
# or with summary data (mean and number of patients)
mn <- mean(data.indiv); n <- length(data.indiv)
posterior.sum <- postmix(prior, m=mn, n=n)
print(posterior.sum)




