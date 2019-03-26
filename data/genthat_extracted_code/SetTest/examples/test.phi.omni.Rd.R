library(SetTest)


### Name: test.phi.omni
### Title: calculate the right-tail probability of omnibus phi-divergence
###   statistics under general correlation matrix.
### Aliases: test.phi.omni

### ** Examples

M = matrix(0.3,10,10) + diag(1-0.3, 10)
test.phi.omni(runif(10), M=M, K0=rep(1,4), K1=rep(5,4), S=c(-1,0,1,2))



