library(SetTest)


### Name: test.phi
### Title: Multiple comparison test using phi-divergence statitics.
### Aliases: test.phi

### ** Examples

test.phi(runif(10), M=diag(10), s = 0.5, k0=1, k1=10)
#When the input are statistics#
stat.test = rnorm(20)
p.test = 2*(1 - pnorm(abs(stat.test)))
test.phi(p.test, M=diag(20), s = 0.5, k0=1, k1=10)



