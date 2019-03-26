library(BNPdensity)


### Name: rfyzstarcens2
### Title: Conditional posterior distribution of the distict vectors
###   (Ystar,Zstar) in the case of censoring
### Aliases: rfyzstarcens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (v, v2, z, z2, xleft, xright, censor_code, distr.k, 
    distr.py0, mu.py0, sigma.py0, distr.pz0, mu.pz0, sigma.pz0) 
{
    alpha <- p0(v, distr = distr.py0, mu = mu.py0, sigma = sigma.py0)/p0(v2, 
        distr = distr.py0, mu = mu.py0, sigma = sigma.py0) * 
        p0(z, distr = distr.pz0, mu = mu.pz0, sigma = sigma.pz0)/p0(z2, 
        distr = distr.pz0, mu = mu.pz0, sigma = sigma.pz0)
    Prod <- 1
    for (i in seq_along(xleft)) {
        fac <- dkcens2_1val(xleft = xleft[i], xright = xright[i], 
            c_code = censor_code[i], distr = distr.k, mu = v, 
            sigma = z)/dkcens2_1val(xleft = xleft[i], xright = xright[i], 
            c_code = censor_code[i], distr = distr.k, mu = v2, 
            sigma = z2)
        Prod <- Prod * fac
    }
    f <- alpha * Prod
    return(f)
  }



