library(BNPdensity)


### Name: Mv
### Title: Continuous Jump heights function
### Aliases: Mv
### Keywords: internal

### ** Examples

## The function is currently defined as
function (u = 0.5, alpha = 1, beta = 1, gama = 1/2, low = 1e-04, 
    upp = 10, N = 5001) 
{
    x <- -log(seq(from = exp(-low), to = exp(-upp), length = N))
    f <- alpha/gamma(1 - gama) * x^(-(1 + gama)) * exp(-(u + 
        beta) * x)
    dx <- diff(x)
    h <- (f[-1] + f[-N])/2
    Mv <- rep(0, N)
    for (i in seq(N - 1, 1)) Mv[i] <- Mv[i + 1] + dx[i] * h[i]
    return(list(v = x, Mv = Mv))
  }



