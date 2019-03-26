library(widals)


### Name: unif.mh
### Title: Local Search Function
### Aliases: unif.mh
### Keywords: ~kwd1 ~kwd2

### ** Examples


x <- unif.mh(100, 1, 1)
hist(x)

## The function is currently defined as
function (n, center, sd) 
{
    w <- sd * sqrt(3)
    a <- center - w
    b <- center + w
    x <- runif(n, a, b)
    return(x)
  }



