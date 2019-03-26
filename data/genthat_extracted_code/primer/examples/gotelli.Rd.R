library(primer)


### Name: gotelli
### Title: Propagule Rain Metapopulation Model
### Aliases: gotelli
### Keywords: methods

### ** Examples


## The function is currently defined as
function (t, y, parms) 
{
    p <- y[1]
    with(as.list(parms), {
        dp <- ce * (1 - p) - e * p
        return(list(dp))
    })
  }

library(deSolve)
p <- c(ce=.1, e=.01)
time <- 1:10
initialN <- .3
out <- ode(y=initialN, times=time, func=gotelli, parms=p) 
plot(time, out[,-1], type='l')



