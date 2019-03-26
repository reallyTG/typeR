library(TFisher)


### Name: p.tfisher.omni
### Title: CDF of omnibus thresholding Fisher's p-value combination
###   statistic under the null hypothesis.
### Aliases: p.tfisher.omni

### ** Examples

q = 0.05
n = 20
TAU1 = c(0.01, 0.05, 0.5, 1)
TAU2 = c(0.1, 0.2, 0.5, 1)
M = matrix(0.3,20,20) + diag(1-0.3,20)
p.tfisher.omni(q=q, n=n, TAU1=TAU1, TAU2=TAU2, M=M)



