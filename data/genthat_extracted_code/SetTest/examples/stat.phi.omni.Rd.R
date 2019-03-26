library(SetTest)


### Name: stat.phi.omni
### Title: calculate the omnibus phi-divergence statistics under general
###   correlation matrix.
### Aliases: stat.phi.omni

### ** Examples

M = toeplitz(1/(1:10)*(-1)^(0:9)) #alternating polynomial decaying correlation matrix
stat.phi.omni(runif(10), M=M, K0=rep(1,4), K1=rep(5,4), S=c(-1,0,1,2))



