library(primer)


### Name: lande
### Title: A Metapopulation Model with Habitat Destruction
### Aliases: lande
### Keywords: methods

### ** Examples

## The function is currently defined as
function (t, y, parms) 
{
    p <- y[1]
    with(as.list(parms), {
        dp <- ci * p * (1 - D - p) - e * p
        return(list(dp))
    })
  }
library(deSolve)
p <- c(ci=.1, e=.01, D=.5)
time <- 1:10
initialN <- .3
out <- ode(y=initialN, times=time, func=lande, parms=p) 
plot(time, out[,-1], type='l')



