library(BNPdensity)


### Name: fcondXA2
### Title: Conditional density evaluation in the fully nonparametric model
### Aliases: fcondXA2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, distr = 1, Tauy, Tauz, J) 
{
    pJ <- J/sum(J)
    K <- matrix(NA, nrow = length(Tauy), ncol = length(x))
    for (i in seq(Tauy)) {
        K[i, ] <- dk(x, distr = distr, mu = Tauy[i], sigma = Tauz[i])
    }
    fcondXA2 <- apply(K, 2, function(x) sum(x * pJ))
    return(fcondXA2)
  }



