library(TFisher)


### Name: p.tpm
### Title: CDF of truncated product method statistic under the null
###   hypothesis.
### Aliases: p.tpm

### ** Examples

pval <- runif(100)
tpmstat <- stat.tpm(p=pval, tau1=0.05)
p.tpm(q=tpmstat, n=100, tau1=0.05)
M = matrix(0.3,100,100) + diag(1-0.3,100)
p.tpm(q=tpmstat, n=100, tau1=0.05, M=M)



