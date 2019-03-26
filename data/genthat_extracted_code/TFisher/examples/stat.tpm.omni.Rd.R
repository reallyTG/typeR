library(TFisher)


### Name: stat.tpm.omni
### Title: Construct omnibus truncated product method statistic.
### Aliases: stat.tpm.omni

### ** Examples

pval = runif(20)
TAU1 = c(0.01, 0.05, 0.5, 1)
stat.tpm.omni(p=pval, TAU1=TAU1)
M = matrix(0.3,20,20) + diag(1-0.3,20)
stat.tpm.omni(p=pval, TAU1=TAU1, M=M)



