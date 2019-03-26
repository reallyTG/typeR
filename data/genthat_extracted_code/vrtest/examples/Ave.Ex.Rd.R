library(vrtest)


### Name: Ave.Ex
### Title: Average Exponential Tests
### Aliases: Ave.Ex
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                      
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])   
Ave.Ex(r)



