library(BNPdensity)


### Name: fcondXA
### Title: Conditional density evaluation in the semiparametric model
### Aliases: fcondXA
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, distr = 1, Tau, J, sigma) 
{
    pJ <- J/sum(J)
    K <- matrix(NA, nrow = length(Tau), ncol = length(x))
    for (i in seq(Tau)) {
        K[i, ] <- dk(x, distr = distr, mu = Tau[i], sigma = sigma)
    }
    fcondXA <- apply(K, 2, function(x) sum(x * pJ))
    return(fcondXA)
  }



