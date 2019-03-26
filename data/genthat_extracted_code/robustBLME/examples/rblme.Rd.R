library(robustBLME)


### Name: rblme
### Title: Fits robust Bayesian Linear Mixed-effects Models (LMM) to data
###   via robust REML estimating functions.
### Aliases: rblme

### ** Examples


## The following example is meant for function documentation.
## For realistic use probably you'll need to take a larger sample and choose a
## "better" bandwidth h.

data(ergoStool)

require(lme4)
fm1 <- lmer(effort~Type + (1| Subject), data = ergoStool)

## tune h to get 0.8% acceptance
hopt <- tune.h(effort~Type + (1|Subject), data = ergoStool, n.samp = 1e+4,
               acc.rate = 0.01, n.sim.HJ = 100, grid.h = seq(0.3, 0.7, len = 3),
               prior = list(beta.sd = 10, s2.scale = 5), n.cores = 1)

## draw posterior samples with hopt.
abc.tmp <- rblme(nabc = 1e+4, h.obj = hopt,
                 n.cores = 1)

# process ABC samples
abc.sim <- t(abc.tmp$abc)
abc.sim[,c(5,6)] <- exp(abc.sim[,c(5,6)])

# ABC posterior
colMeans(abc.sim)

# REML estimates
summary(fm1)




