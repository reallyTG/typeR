library(vrtest)


### Name: Subsample.test
### Title: Subsampling test of Whang and Kim (2003)
### Aliases: Subsample.test
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                  
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])   
kvec <- c(2,5,10)
Subsample.test(r,kvec)



