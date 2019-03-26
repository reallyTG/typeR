library(dga)


### Name: tmpfun
### Title: Another Helper Function.
### Aliases: tmpfun
### Keywords: zero

### ** Examples


## The function is currently defined as
function (x, p) 
{
    tmp <- rep(0, p)
    tmp[x] <- 1
    return((tmp))
  }



