library(primer)


### Name: lvcomp2
### Title: Two Species Lotka-Volterra Competition
### Aliases: lvcomp2
### Keywords: methods

### ** Examples

## The function is currently defined as
function (t, n, parms) 
{
    with(as.list(parms), {
        dn1dt <- r1 * n[1] * (1 - a11 * n[1] - a12 * n[2])
        dn2dt <- r2 * n[2] * (1 - a22 * n[2] - a21 * n[1])
        list(c(dn1dt, dn2dt))
    })
  }
library(deSolve) 
parms <- c(r1 = 1, r2 = 0.1, a11 = 0.2, a21 = 0.1, a22 = 0.02, a12 = 0.01) 
initialN <- c(1, 1) 
out <- ode(y = initialN, times = 1:100, func = lvcomp2, parms = parms) 
matplot(out[, 1], out[, -1], type = "l") 



