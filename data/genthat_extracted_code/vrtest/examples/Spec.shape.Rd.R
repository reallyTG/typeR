library(vrtest)


### Name: Spec.shape
### Title: Spectral shape tests for random walk
### Aliases: Spec.shape
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                   
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])     
Spec.shape(r)



