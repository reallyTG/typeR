library(SetTest)


### Name: pbj
### Title: CDF of Berk-Jones statitic under the null hypothesis.
### Aliases: pbj

### ** Examples

pval <- runif(10)
bjstat <- stat.phi(pval, s=1, k0=1, k1=10)$value
pbj(q=bjstat, M=diag(10), k0=1, k1=10)



