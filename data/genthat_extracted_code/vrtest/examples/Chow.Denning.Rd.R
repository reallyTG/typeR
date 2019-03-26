library(vrtest)


### Name: Chow.Denning
### Title: Chow-Denning Multiple Variance Ratio Tests
### Aliases: Chow.Denning
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                  
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])      
kvec <- c(2,5,10)
Chow.Denning(r,kvec) 



