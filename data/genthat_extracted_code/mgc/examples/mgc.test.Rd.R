library(mgc)


### Name: mgc.test
### Title: MGC Permutation Test
### Aliases: mgc.test

### ** Examples


library(mgc)

n = 100; d = 2
data <- mgc.sims.linear(n, d)
result <- mgc.test(data$X, data$Y, rep=10)




