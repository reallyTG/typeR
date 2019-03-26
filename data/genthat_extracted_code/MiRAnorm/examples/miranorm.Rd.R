library(MiRAnorm)


### Name: miranorm
### Title: Adaptive algorithm to identify normalization genes.
### Aliases: miranorm

### ** Examples

dat = simData(n.trt=15, n.ctrl=15, n.gene=30, n.err=10, sigma.error = c(1, 0.3), mean.sample = 2,
sigma.sample = 1.88 , sigma.gene = 0.1, n.big.effect = 5, n.small.effect = 10, mean.big.effect = 2,
mean.small.effect = 1.2)$sim

obj = miranorm(data = dat, group = dat$Group, method="simple")





