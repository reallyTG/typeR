library(SetTest)


### Name: stat.hc
### Title: Construct Higher Criticism (HC) statitics.
### Aliases: stat.hc

### ** Examples

stat.hc(runif(10))
#When the input are statistics#
stat.test = rnorm(20)
p.test = 1 - pnorm(stat.test)
stat.hc(p.test, k0 = 1, k1 = 10)



