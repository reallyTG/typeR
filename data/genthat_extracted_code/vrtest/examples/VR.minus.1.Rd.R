library(vrtest)


### Name: VR.minus.1
### Title: Absolute Value of (VR - 1)
### Aliases: VR.minus.1
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca             
nob <- length(y)
kvec <- c(2,5,10)
r <- log(y[2:nob])-log(y[1:(nob-1)])          
VR.minus.1(r,kvec)



