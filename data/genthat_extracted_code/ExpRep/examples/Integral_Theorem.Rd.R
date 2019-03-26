library(ExpRep)


### Name: Integral_Theorem
### Title: Integral Theorem of DeMoivre-Laplace
### Aliases: Integral_Theorem

### ** Examples

Prob<-Integral_Theorem(n=100,p=0.5,linf=0,lsup=50)
Prob

## The function is currently defined as
function (n = 100, p = 0.5, linf = 0, lsup = 50) 
{
    A <- (linf - n * p)/sqrt(n * p * (1 - p))
    B <- (lsup - n * p)/sqrt(n * p * (1 - p))
    P <- pnorm(B) - pnorm(A)
    return(P)
  }



