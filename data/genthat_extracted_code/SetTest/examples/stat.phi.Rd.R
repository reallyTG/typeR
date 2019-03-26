library(SetTest)


### Name: stat.phi
### Title: Construct phi-divergence statitics.
### Aliases: stat.phi

### ** Examples

stat.phi(runif(10), s = 2)
#When the input are statistics#
stat.test = rnorm(20)
p.test = 1 - pnorm(stat.test)
stat.phi(p.test, s = 0.5, k0 = 2, k1 = 5)



