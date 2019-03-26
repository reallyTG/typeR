library(SetTest)


### Name: test.bj
### Title: Multiple comparison test using Berk and Jones (BJ) statitics.
### Aliases: test.bj

### ** Examples

test.bj(runif(10), M=diag(10), k0=1, k1=10)
#When the input are statistics#
stat.test = rnorm(20)
p.test = 2*(1 - pnorm(abs(stat.test)))
test.bj(p.test, M=diag(20), k0=1, k1=10)



