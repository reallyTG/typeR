library(TFisher)


### Name: stat.soft.omni
### Title: Construct omnibus soft-thresholding Fisher's p-value combination
###   statistic.
### Aliases: stat.soft.omni

### ** Examples

pval = runif(20)
TAU1 = c(0.01, 0.05, 0.5, 1)
stat.soft.omni(p=pval, TAU1=TAU1)
M = matrix(0.3,20,20) + diag(1-0.3,20)
stat.soft.omni(p=pval, TAU1=TAU1, M=M)



