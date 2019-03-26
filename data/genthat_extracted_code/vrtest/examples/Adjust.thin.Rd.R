library(vrtest)


### Name: Adjust.thin
### Title: Adjustment for thinly-traded returns
### Aliases: Adjust.thin
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                           
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)]) 
Adjust.thin(r)



