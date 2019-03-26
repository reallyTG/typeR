library(rpf)


### Name: rpf.rescale
### Title: Rescale item parameters
### Aliases: rpf.rescale rpf_rescale_wrapper
###   rpf.rescale,rpf.base,numeric,numeric,matrix-method

### ** Examples

spec <- rpf.grm()
p1 <- rpf.rparam(spec)
testPoint <- rnorm(1)
move <- rnorm(1)
cov <- as.matrix(rlnorm(1))
Icov <- solve(cov)
padj <- rpf.rescale(spec, p1, move, cov)
pr1 <- rpf.prob(spec, padj, (testPoint-move) %*% Icov)
pr2 <- rpf.prob(spec, p1, testPoint)
abs(pr1 - pr2) < 1e9



