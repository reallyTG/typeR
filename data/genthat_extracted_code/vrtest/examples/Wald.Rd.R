library(vrtest)


### Name: Wald
### Title: Wald Test of Richardson and Smith (1991)
### Aliases: Wald
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                        
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])     
kvec <- c(2,5,10)
Wald(r,kvec) 



