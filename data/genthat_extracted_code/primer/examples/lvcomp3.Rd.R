library(primer)


### Name: lvcomp3
### Title: Three Species Lotka-Volterra Competition
### Aliases: lvcomp3
### Keywords: methods

### ** Examples

## The function is currently defined as
function (t, n, parms) 
{
    with(as.list(parms), {
        dn1dt <- r1 * n[1] * (1 - a11 * n[1] - a12 * n[2] - a13 * 
            n[3])
        dn2dt <- r2 * n[2] * (1 - a22 * n[2] - a21 * n[1] - a23 * 
            n[3])
        dn3dt <- r3 * n[3] * (1 - a33 * n[3] - a31 * n[1] - a32 * 
            n[2])
        list(c(dn1dt, dn2dt, dn3dt))
    })
  }

library(deSolve) 
parms <- c(r1 = 0.1, r2 = 0.2, r3 = 0.3, 
a11 = 0.1, a12 = 0.01, a13 = 0.01, 
a21 = 0.01, a22 = 0.15, a23 = 0.01, 
a31 = 0.01, a32 = 0.01, a33 = 0.2) 
initialN <- c(1, 1, 1) 
out <- ode(y = initialN, times = 1:100, func = lvcomp3, parms = parms) 
matplot(out[, 1], out[, -1], type = "l") 



