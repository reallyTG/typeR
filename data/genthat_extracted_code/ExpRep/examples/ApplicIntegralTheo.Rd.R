library(ExpRep)


### Name: ApplicIntegralTheo
### Title: Applications of the Integral Theorem of DeMoivre-Laplace.
### Aliases: ApplicIntegralTheo

### ** Examples

beta<-ApplicIntegralTheo(Applic="beta",n=369,p=0.4,alpha=0.05) 
beta

alpha<-ApplicIntegralTheo(Applic="alpha",n=369,p=0.4,beta=0.95) 
alpha

n<-ApplicIntegralTheo(Applic="n",p=0.4,alpha=0.05,beta=0.95) 
n

## The function is currently defined as
function (Applic = "alpha", n = 10000, p = 0.5, alpha = 0.01, 
    beta = 0.9) 
{
    Alpha <- function(n, p, beta) {
        a <- (beta + 1)/2
        alpha <- ((p * (1 - p)/n)^0.5) * qnorm(a)
        return(alpha)
    }
    Beta <- function(n, p, alpha) {
        b <- alpha * (n/(p * (1 - p)))^0.5
        beta <- 2 * pnorm(b) - 1
        return(beta)
    }
    Repetitions <- function(p, alpha, beta) {
        a <- (beta + 1)/2
        n <- (p * (1 - p) * ((qnorm(a)/alpha)^2))%/%1 + 1
        return(n)
    }
    options(digits = 17)
    value <- switch(Applic, alpha = Alpha(n, p, beta), beta = Beta(n, 
        p, alpha), n = Repetitions(p, alpha, beta))
    return(value)
  }



