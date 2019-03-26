library(InspectChangepoint)


### Name: locate.change
### Title: Single changepoint estimation
### Aliases: locate.change
### Keywords: ~ts

### ** Examples

n <- 2000; p <- 1000; k <- 32; z <- 400; vartheta <- 0.12; sigma <- 1; shape <- 3
noise <- 0; corr <- 0
obj <- single.change(n,p,k,z,vartheta,sigma,shape,noise,corr)
x <- obj$x
locate.change(x)



