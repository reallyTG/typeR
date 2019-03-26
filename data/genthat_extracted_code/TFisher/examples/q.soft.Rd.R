library(TFisher)


### Name: q.soft
### Title: Quantile of soft-thresholding Fisher's p-value combination
###   statistic under the null hypothesis.
### Aliases: q.soft

### ** Examples

## The 0.05 critical value of soft-thresholding statistic when n = 10:
q.soft(p=.99, n=20, tau1 = 0.05)
M = matrix(0.9,20,20) + diag(1-0.9,20)
q.soft(p=.99, n=20, tau1 = 0.05, M=M)



