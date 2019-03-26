library(InspectChangepoint)


### Name: single.change
### Title: High-dimensional time series with exactly one change in the mean
###   structure
### Aliases: single.change
### Keywords: ~data

### ** Examples

n <- 2000; p <- 100; k <- 10; z <- 800; vartheta <- 1; sigma <- 1; shape <- 3
noise <- 0; corr <- 0
obj <- single.change(n,p,k,z,vartheta,sigma, shape, noise, corr)
plot(obj, noise = TRUE)



