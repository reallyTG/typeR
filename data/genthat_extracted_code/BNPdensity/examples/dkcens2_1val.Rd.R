library(BNPdensity)


### Name: dkcens2_1val
### Title: Density evaluation once
### Aliases: dkcens2_1val
### Keywords: internal

### ** Examples

## The function is currently defined as
function (xleft, xright, c_code, distr = NULL, mu = NULL, sigma = NULL) 
{
    if (c_code == 1) 
        dk(x = xleft, distr, mu, sigma)
    else if (c_code == 2) 
        pk(xright, distr, mu, sigma)
    else if (c_code == 0) 
        1 - pk(xleft, distr, mu, sigma)
    else if (c_code == 3) 
        pk(xright, distr, mu, sigma) - pk(xleft, distr, mu, sigma)
    else stop("Wrong integer code for censored data")
  }



