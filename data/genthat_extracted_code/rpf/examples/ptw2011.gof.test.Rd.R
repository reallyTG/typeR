library(rpf)


### Name: ptw2011.gof.test
### Title: Compute the P value that the observed and expected tables come
###   from the same distribution
### Aliases: ptw2011.gof.test

### ** Examples

draws <- 17
observed <- matrix(c(.294, .176, .118, .411), nrow=2) * draws
expected <- matrix(c(.235, .235, .176, .353), nrow=2) * draws
ptw2011.gof.test(observed, expected)  # not signficiant



