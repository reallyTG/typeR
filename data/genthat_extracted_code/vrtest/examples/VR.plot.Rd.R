library(vrtest)


### Name: VR.plot
### Title: Variance Ratio Plot
### Aliases: VR.plot
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                                 
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])
kvec <- c(2,5,10)
VR.plot(r,kvec)



