library(pleio)


### Name: pleio.q.test
### Title: Single test of the number of traits associated with genotype
### Aliases: pleio.q.test

### ** Examples

data(pleio.qdemo)
fit <- pleio.q.fit(y, geno)
## usual multivariate test of whether all betas = 0
test0 <- pleio.q.test(fit, count.nonzero.beta = 0)
test0
## test whether allowing 2 betas to be non-zero fits data
test2 <- pleio.q.test(fit, count.nonzero.beta = 2)
test2



