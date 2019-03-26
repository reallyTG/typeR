library(RBesT)


### Name: mixnorm
### Title: Normal Mixture Density
### Aliases: mixnorm sigma mn2norm summary.normMix sigma.normMix sigma<-

### ** Examples


nm <- mixnorm(rob=c(0.2, 0, 2), inf=c(0.8, 2, 2), sigma=5)

print(nm)
summary(nm)
plot(nm)

set.seed(1)
mixSamp <- rmix(nm, 500)
plot(nm, samp=mixSamp)

# support defined by quantiles
qmix(nm, c(0.01, 0.99))

# density function
dmix(nm, seq(-5,5,by=2))

# distribution function
pmix(nm, seq(-5,5,by=2))

# the reference scale can be changed (it determines the ESS)
ess(nm)

sigma(nm) <- 10
ess(nm)




