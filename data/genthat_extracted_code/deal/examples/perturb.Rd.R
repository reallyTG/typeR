library(deal)


### Name: perturb
### Title: Perturbs a network
### Aliases: perturb
### Keywords: iplot

### ** Examples

set.seed(200)
data(rats)
fit       <- network(rats)
fit.prior <- jointprior(fit)
fit       <- getnetwork(learn(fit,rats,fit.prior))
fit.new   <- getnetwork(perturb(fit,rats,fit.prior,degree=10))

data(ksl)
ksl.nw    <- network(ksl)
ksl.rand  <- getnetwork(perturb(ksl.nw,nocalc=TRUE,degree=10))
plot(ksl.rand)



