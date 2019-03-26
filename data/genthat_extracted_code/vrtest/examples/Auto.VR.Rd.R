library(vrtest)


### Name: Auto.VR
### Title: Automatic Variance Ratio Test
### Aliases: Auto.VR
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                           
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])      
Auto.VR(r)



