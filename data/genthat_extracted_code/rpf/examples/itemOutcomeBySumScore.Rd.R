library(rpf)


### Name: itemOutcomeBySumScore
### Title: Produce an item outcome by observed sum-score table
### Aliases: itemOutcomeBySumScore

### ** Examples

set.seed(1)
spec <- list()
spec[1:3] <- rpf.grm(outcomes=3)
param <- sapply(spec, rpf.rparam)
data <- rpf.sample(5, spec, param)
colnames(param) <- colnames(data)
grp <- list(spec=spec, param=param, data=data)
itemOutcomeBySumScore(grp, c(FALSE,TRUE,TRUE), 1L)



