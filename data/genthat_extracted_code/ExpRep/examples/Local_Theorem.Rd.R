library(ExpRep)


### Name: Local_Theorem
### Title: Local Theorem of DeMoivre-Laplace
### Aliases: Local_Theorem

### ** Examples

Prob<-Local_Theorem(n=100,m=50,p=0.02)
Prob

## The function is currently defined as
function (n, m, p) 
{
    a <- n * p
    b <- sqrt(a * (1 - p))
    x <- (m - a)/b
    P <- dnorm(x, 0, 1)/b
    return(P)
  }



