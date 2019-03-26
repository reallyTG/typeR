library(vrtest)


### Name: Wright
### Title: Wright's Rank and Sign Tests
### Aliases: Wright
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                    
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])  
kvec <- c(2,5,10)
Wright(r,kvec) 



