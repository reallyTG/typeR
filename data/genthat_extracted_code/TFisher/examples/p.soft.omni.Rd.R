library(TFisher)


### Name: p.soft.omni
### Title: CDF of omnibus soft-thresholding Fisher's p-value combination
###   statistic under the null hypothesis.
### Aliases: p.soft.omni

### ** Examples

q = 0.01
n = 20
TAU1 = c(0.01, 0.05, 0.5, 1)
M = matrix(0.3,20,20) + diag(1-0.3,20)
p.soft.omni(q=q, n=n, TAU1=TAU1, M=M)



