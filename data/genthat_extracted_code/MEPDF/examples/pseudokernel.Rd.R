library(MEPDF)


### Name: pseudokernel
### Title: pseudokernel
### Aliases: pseudokernel

### ** Examples

data<-mvtnorm::rmvnorm(n = 100,mean = c(0,0),sigma = diag(2))

pdf<-pseudokernel(data = data,mn = c(-2,-2),mx = c(2,2),grid.sizes = c(0.1,0.1),rings = 1)



