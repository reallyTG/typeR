library(SetTest)


### Name: test.hc
### Title: Multiple comparison test using Higher Criticism (HC) statitics.
### Aliases: test.hc

### ** Examples

pval.test = runif(10)
test.hc(pval.test, M=diag(10), k0=1, k1=10)
test.hc(pval.test, M=diag(10), k0=1, k1=10, LS = TRUE)
test.hc(pval.test, M=diag(10), k0=1, k1=10, ZW = TRUE)
#When the input are statistics#
stat.test = rnorm(20)
p.test = 2*(1 - pnorm(abs(stat.test)))
test.hc(p.test, M=diag(20), k0=1, k1=10)



