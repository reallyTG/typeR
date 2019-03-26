library(BNPdensity)


### Name: fcondYZXAcens2
### Title: Conditional posterior distribution of the bivariate latents
###   (Y,Z) in the case of censoring
### Aliases: fcondYZXAcens2
### Keywords: internal

### ** Examples

## The function is currently defined as
function (xleft, xright, censor_code_filters, distr, Tauy, Tauz, 
    J) 
{
    K <- matrix(NA, nrow = length(Tauy), ncol = length(xleft))
    for (i in seq(Tauy)) {
        K[i, ] <- dkcens2(xleft, xright, c_code_filters = censor_code_filters, 
            distr = distr, mu = Tauy[i], sigma = Tauz[i]) * J[i]
    }
    if (any(is.na(K))) 
        print(K, Tauy, Tauz, J)
    pK <- prop.table(K, margin = 2)
    j <- apply(pK, 2, function(x) sample(length(Tauy), size = 1, 
        prob = x))
    return(matrix(c(y = Tauy[j], z = Tauz[j]), nrow = length(xleft), 
        ncol = 2))
  }



