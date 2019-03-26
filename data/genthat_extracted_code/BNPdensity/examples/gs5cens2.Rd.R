library(BNPdensity)


### Name: gs5cens2
### Title: Conditional posterior distribution of sigma in the case of
###   censoring
### Aliases: gs5cens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (sigma, xleft, xright, censor_code, y, distr = 1, asigma = 1, 
    bsigma = 2, delta = 4) 
{
    sigmaStar <- rgamma(1, shape = delta, rate = delta/sigma)
    sigmaT <- sigma
    qgammas <- sigmaT/sigmaStar
    Qgammas <- sigmaStar/sigmaT
    Term2 <- qgammas^(2 * delta - 1) * exp(-delta * (qgammas - 
        Qgammas))
    Kgamma <- Qgammas^(asigma - 1) * exp(-bsigma * (sigmaStar - 
        sigmaT))
    Prod <- 1
    for (i in seq_along(xleft)) {
        Prod <- Prod * dkcens2_1val(xleft = xleft[i], xright = xright[i], 
            c_code = censor_code[i], distr = distr, mu = y[i], 
            sigma = sigmaStar)/dkcens2_1val(xleft = xleft[i], 
            xright = xright[i], c_code = censor_code[i], distr = distr, 
            mu = y[i], sigma = sigmaT)
    }
    q3 <- min(1, Kgamma * Prod * Term2)
    sigma <- ifelse(runif(1) <= q3, sigmaStar, sigmaT)
    return(sigma)
  }



