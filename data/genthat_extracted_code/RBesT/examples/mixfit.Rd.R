library(RBesT)


### Name: mixfit
### Title: Fit of Mixture Densities to Samples
### Aliases: mixfit mixfit.default mixfit.gMAP mixfit.gMAPpred mixfit.array

### ** Examples

bmix <- mixbeta(rob=c(0.2, 1, 1), inf=c(0.8, 10, 2))

bsamp <- rmix(bmix, 1000)

bfit <- mixfit(bsamp, type="beta", Nc=2)

# diagnostic plots can easily by generated from the EM fit with
bfit.check <- plot(bfit)

names(bfit.check)

# check convergence of parameters
bfit.check$mix
bfit.check$mixens

# obtain the log-likelihood
logLik(bfit)

# or AIC
AIC(bfit)




