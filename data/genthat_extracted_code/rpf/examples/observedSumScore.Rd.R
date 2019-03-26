library(rpf)


### Name: observedSumScore
### Title: Compute the observed sum-score
### Aliases: observedSumScore

### ** Examples

spec <- list()
spec[1:3] <- rpf.grm(outcomes=3)
param <- sapply(spec, rpf.rparam)
data <- rpf.sample(5, spec, param)
colnames(param) <- colnames(data)
grp <- list(spec=spec, param=param, data=data)
observedSumScore(grp)



