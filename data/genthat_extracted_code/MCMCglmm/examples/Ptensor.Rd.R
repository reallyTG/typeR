library(MCMCglmm)


### Name: Ptensor
### Title: Tensor of Sample (Mixed) Central Moments
### Aliases: Ptensor
### Keywords: array

### ** Examples

n<-1000
y<-matrix(rnorm(n), n/2, 2)
Ptensor(y,2)
cov(y)*((n-1)/n)



