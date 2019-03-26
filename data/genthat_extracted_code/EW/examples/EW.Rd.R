library(EW)


### Name: EW
### Title: Edgeworth Expansion
### Aliases: EW
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rvlist, miu = 0, sigma = 1, e = 10^-5, ord = 1) 
{
    rvlist = as.numeric(rvlist)
    kappa <- function(t) {
        log(mgf(t, rvlist))
    }
    mgf <- function(t, rv = c()) {
        mean(exp(t %*% rv))
    }
    diff <- function(f, e = 10^-5) {
        ft <- function(x) {
            (f(x + e) - f(x - e))/(2 * e)
        }
        ft
    }
    kappa3 <- diff(diff(diff(kappa)))
    kappa4 <- diff(diff(diff(diff(kappa))))
    k3 <- kappa3(0) * 3 * 2 * 1 * e^3
    k4 <- kappa4(0) * 4 * 3 * 2 * 1 * e^4
    PhiP <- function(tkk, e = 10^-5) {
        Phi <- function(val1) {
            pnorm(val1, 0, 1)
        }
        (Phi(tkk + e) - Phi(tkk - e))/(2 * e)
    }
    p1 <- function(y) {
        (-1/6) * k3 * (y^2 - 1) * PhiP(y)
    }
    p2 <- function(y) {
        -((-1/24) * k4 * y * (y^2 - 3) + (1/72) * k3 * y * (y^4 - 
            10 * y^2 + 15)) * PhiP(y)
    }
    if (ord == 1) 
        p1
    else p2
  }



