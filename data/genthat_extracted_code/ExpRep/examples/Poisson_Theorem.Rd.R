library(ExpRep)


### Name: Poisson_Theorem
### Title: Poisson Theorem.
### Aliases: Poisson_Theorem

### ** Examples

Prob<-Poisson_Theorem(n=100,m=50,p=0.002)
Prob

## The function is currently defined as
function (n, m, p) 
{
    landa <- n * p
    P <- dpois(m, landa)
    return(P)
  }



