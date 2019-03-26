library(SetTest)


### Name: stat.bj
### Title: Construct Berk and Jones (BJ) statitics.
### Aliases: stat.bj

### ** Examples

stat.bj(runif(10))
#When the input are statistics#
stat.test = rnorm(20)
p.test = 1 - pnorm(stat.test)
stat.bj(p.test, k0 = 2, k1 = 20)



