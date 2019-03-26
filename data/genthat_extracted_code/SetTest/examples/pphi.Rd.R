library(SetTest)


### Name: pphi
### Title: calculate the left-tail probability of phi-divergence under
###   general correlation matrix.
### Aliases: pphi

### ** Examples

M = toeplitz(1/(1:10)*(-1)^(0:9)) #alternating polynomial decaying correlation matrix
pphi(q=2, M=M, k0=1, k1=5, s=2)
pphi(q=2, M=diag(10), k0=1, k1=5, s=2)



