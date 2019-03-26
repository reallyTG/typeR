library(vrtest)


### Name: Lo.Mac
### Title: Lo-MacKinlay variance Ratio Tests
### Aliases: Lo.Mac
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                 
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])       
kvec <- c(2,5,10)
Lo.Mac(r,kvec) 



