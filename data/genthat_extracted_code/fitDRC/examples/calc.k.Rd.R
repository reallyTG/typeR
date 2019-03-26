library(fitDRC)


### Name: calc.k
### Title: Calculating the ratio of normalising constants of the not
###   necessarily normalised lower and upper probability density functions
###   of a Density Ratio Class.
### Aliases: calc.k
### Keywords: Ratio of normalising constants

### ** Examples

p <- c(0.05, 0.25, 0.5, 0.75, 0.95)
q <- qnorm(p)

dist.lower <- dist.normal.create(par=c(1,2))
dist.upper <- dist.normal.create(par=c(3,4))

par.lower <- dist.lower$par
par.upper <- dist.upper$par

#calc.k(p, q, dist.lower, dist.upper, c(0,1), c(0,1))       # perfect matching
                                                            # of elicited data 
                                                            # with chosen shapes
#calc.k(p, q, dist.lower, dist.upper, par.lower, par.upper) # general case
#calc.k(p, q, dist.lower, dist.upper,  c(0,50), c(0,1))     # not compatible
                                                            # with the def. of
                                                            # the DRC.


## The function is currently defined as
function (p, q, dist.lower, dist.upper, par.lower, par.upper) 
{
    x.min.lower <- CDFinv(dist.lower, 0.001, par.lower)
    x.max.lower <- CDFinv(dist.lower, 0.999, par.lower)
    x.min.upper <- CDFinv(dist.upper, 0.001, par.upper)
    x.max.upper <- CDFinv(dist.upper, 0.999, par.upper)
    x.min <- min(x.min.lower, x.min.upper)
    x.max <- max(x.max.lower, x.max.upper)
    x <- seq(x.min, x.max, length = 1e+06)
    Lambda <- max(PDF(dist.lower, x, par.lower)/PDF(dist.upper, 
                  x, par.upper))
    k1 <- (p * (1 - CDF(dist.lower, q, par.lower)))/(CDF(dist.upper, 
           q, par.upper) * (1 - p))
    k2 <- (CDF(dist.lower, q, par.lower) * (1 - p))/(p * (1 - 
           CDF(dist.upper, q, par.upper)))
    Kappa <- max(Lambda, k1, k2)
    return(list(Kappa = Kappa, Lambda = Lambda))
  }



