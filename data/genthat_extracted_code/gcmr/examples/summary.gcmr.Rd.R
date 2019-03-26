library(gcmr)


### Name: summary.gcmr
### Title: Methods for gcmr Objects
### Aliases: print.gcmr summary.gcmr print.summary.gcmr coef.gcmr vcov.gcmr
###   bread.gcmr estfun.gcmr coeftest.gcmr logLik.gcmr terms.gcmr
###   model.frame.gcmr model.matrix.gcmr

### ** Examples

data(epilepsy)
fit <- gcmr(counts ~ offset(log(time)) + visit + trt + visit:trt, data = epilepsy, 
subset = (id != 49), marginal = negbin.marg, cormat = cluster.cormat(id, "ar1"), 
options=gcmr.options(seed=123, nrep=c(25,100) ))
summary(fit)



