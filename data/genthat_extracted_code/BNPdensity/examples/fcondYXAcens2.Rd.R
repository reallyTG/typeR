library(BNPdensity)


### Name: fcondYXAcens2
### Title: Conditional posterior distribution of the latents Y in the
###   censoring case
### Aliases: fcondYXAcens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (xleft, xright, censor_code_filters, distr, Tau, J, 
    sigma) 
{
    K <- matrix(NA, nrow = length(Tau), ncol = length(xleft))
    for (i in seq(Tau)) {
        K[i, ] <- dkcens2(xleft = xleft, xright = xright, c_code_filters = censor_code_filters, 
            distr = distr, mu = Tau[i], sigma = sigma) * J[i]
    }
    pK <- prop.table(K, margin = 2)
    y <- apply(pK, 2, function(x) sample(Tau, size = 1, prob = x))
    return(y)
  }



