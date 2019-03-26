library(bspec)


### Name: likelihood
### Title: Prior, likelihood and posterior
### Aliases: dprior likelihood marglikelihood dposterior dprior.bspec
###   likelihood.bspec marglikelihood.bspec dposterior.bspec
### Keywords: ts

### ** Examples

lhspec <- bspec(lh, priordf=1, priorscale=0.6)

# draw sample from posterior:
posteriorsample <- sample(lhspec)

# plot the sample:
plot(lhspec)
lines(lhspec$freq, posteriorsample, type="b", col="red")

# compute prior, likelihood, posterior:
print(c("prior"              = dprior(lhspec, posteriorsample),
        "likelihood"         = likelihood(lhspec, posteriorsample),
        "posterior"          = dposterior(lhspec, posteriorsample),
        "marginal likelihood"= marglikelihood(lhspec)))



