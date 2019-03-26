library(vrtest)


### Name: Auto.Q
### Title: Automatic Portmanteau Test
### Aliases: Auto.Q
### Keywords: htest

### ** Examples

data(exrates)
y <- exrates$ca                          
nob <- length(y)
r <- log(y[2:nob])-log(y[1:(nob-1)])    
Auto.Q(r)



