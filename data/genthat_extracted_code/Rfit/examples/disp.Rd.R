library(Rfit)


### Name: disp
### Title: Jaeckel's Dispersion Function
### Aliases: disp

### ** Examples


## The function is currently defined as
function (beta, x, y, scores) 
{
    x <- as.matrix(x)
    e <- y - x %*% beta
    r <- rank(e, ties.method = "first")/(length(e) + 1)
    scores@phi(r) %*% e
  }



