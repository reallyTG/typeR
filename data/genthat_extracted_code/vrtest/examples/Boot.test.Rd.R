library(vrtest)


### Name: Boot.test
### Title: Bootstrap Variance Ratio Tests
### Aliases: Boot.test
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                   
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])    
kvec <- c(2,5,10)
Boot.test(r,kvec,nboot=500,wild="Normal")



