library(TFisher)


### Name: q.tpm
### Title: Quantile of truncated product method statistic under the null
###   hypothesis.
### Aliases: q.tpm

### ** Examples

## The 0.05 critical value of TPM statistic when n = 10:
q.tpm(p=.95, n=20, tau1 = 0.05)
M = matrix(0.3,20,20) + diag(1-0.3,20)
q.tpm(p=.95, n=20, tau1 = 0.05, M=M)



