library(BNPdensity)


### Name: rfystarcens2
### Title: Conditional posterior distribution of the distict Ystar in the
###   case of censoring
### Aliases: rfystarcens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (v, v2, xleft, xright, censor_code, distr.k, sigma.k, 
    distr.p0, mu.p0, sigma.p0) 
{
    alpha <- p0(v, distr = distr.p0, mu = mu.p0, sigma = sigma.p0)/p0(v2, 
        distr = distr.p0, mu = mu.p0, sigma = sigma.p0)
    Prod <- 1
    for (i in seq_along(xleft)) {
        fac <- dkcens2_1val(xleft = xleft[i], xright = xright[i], 
            c_code = censor_code[i], distr = distr.k, mu = v, 
            sigma = sigma.k)/dkcens2_1val(xleft = xleft[i], xright = xright[i], 
            c_code = censor_code[i], distr = distr.k, mu = v2, 
            sigma = sigma.k)
        Prod <- Prod * fac
    }
    f <- alpha * Prod
    return(f)
  }



