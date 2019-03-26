library(highD2pop)


### Name: rdblepareto
### Title: The double pareto distribution
### Aliases: rdblepareto
### Keywords: distribution datagen

### ** Examples


## The function is currently defined as
function (n, shape, scale) 
{
    u <- runif(n, 0, 1)
    x <- scale * (1 - u)^(-1/shape) - scale
    y <- sample(c(-1, 1), n, replace = TRUE) * x
    return(y)
  }


x <- rdblepareto(500,1.5,1)

plot(density(x))



