library(Rfit)


### Name: grad
### Title: Calculate the Gradiant of Jaekel's Dispersion Function
### Aliases: grad

### ** Examples

## The function is currently defined as
function (x, y, beta, scores) 
{
    x <- as.matrix(x)
    e <- y - x %*% beta
    r <- rank(e, ties.method = "first")/(length(e) + 1)
    -t(x) %*% scores@phi(r)
  }



