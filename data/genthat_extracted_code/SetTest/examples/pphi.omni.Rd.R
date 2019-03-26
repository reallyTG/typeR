library(SetTest)


### Name: pphi.omni
### Title: calculate the left-tail probability of omnibus phi-divergence
###   statistics under general correlation matrix.
### Aliases: pphi.omni

### ** Examples

M = matrix(0.3,10,10) + diag(1-0.3, 10)
pphi.omni(0.05, M=M, K0=rep(1,4), K1=rep(5,4), S=c(-1,0,1,2))



