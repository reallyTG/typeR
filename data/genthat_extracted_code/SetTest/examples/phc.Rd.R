library(SetTest)


### Name: phc
### Title: CDF of Higher Criticism statitic under the null hypothesis.
### Aliases: phc

### ** Examples

pval <- runif(10)
hcstat <- stat.phi(pval, s=2, k0=1, k1=5)$value
phc(q=hcstat, M=diag(10), k0=1, k1=10)



