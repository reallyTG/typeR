library(widals)


### Name: dlog.norm
### Title: Local Search Function
### Aliases: dlog.norm
### Keywords: ~kwd1 ~kwd2

### ** Examples


x <- dlog.norm(100, 1, 1)
hist(x)

## The function is currently defined as
function (n, center, sd) 
{
    return(exp(rnorm(n, log(center), sd)))
  }



