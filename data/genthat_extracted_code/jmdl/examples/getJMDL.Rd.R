library(jmdl)


### Name: getJMDL
### Title: Extract or Get Generalized Components from a Fitted Joint Mean
###   Correlation Model
### Aliases: getJMDL getJMDL.jmdlMod

### ** Examples


mydat <- toydata
fit <- jmdl(Y|id|time ~ X, data = mydat, q = 2, family ='Bernoulli')
beta <- getJMDL(fit, "beta")
beta
loglik  <- getJMDL(fit, "loglik")
loglik




