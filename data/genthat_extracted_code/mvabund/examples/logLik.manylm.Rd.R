library(mvabund)


### Name: logLik.manylm
### Title: Calculate the Log Likelihood
### Aliases: logLik.manylm
### Keywords: models multivariate

### ** Examples

data(spider)
spiddat <- mvabund(spider$abund)
X <- spider$x

lm.spider <- manylm(spiddat~X)
logLik(lm.spider)



