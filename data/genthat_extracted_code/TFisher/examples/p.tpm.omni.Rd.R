library(TFisher)


### Name: p.tpm.omni
### Title: CDF of omnibus truncated product method statistic under the null
###   hypothesis.
### Aliases: p.tpm.omni

### ** Examples

q = 0.05
n = 20
TAU1 = c(0.01, 0.05, 0.5, 1)
M = matrix(0.3,20,20) + diag(1-0.3,20)
p.tpm.omni(q=q, n=n, TAU1=TAU1, M=M)



