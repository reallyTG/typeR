library(MaskJointDensity)


### Name: CheckRho
### Title: An old artefact from testing, purely for backwards compatibility
### Aliases: CheckRho
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x1, x2, mu1, mu2, s1, s2, Srho12, G_Point7, GH_Quadrature) 
{
    fhat1 <- kde(x = x1, binned = TRUE)
    fhat2 <- kde(x = x2, binned = TRUE)
    g <- 0
    m <- 7
    for (l in 1:m) {
        for (k in 1:m) {
            g <- g + GH_Quadrature[l] * GH_Quadrature[k] * ((qkde(pnorm(G_Point7[l]), 
                fhat1) - mu1)/s1) * ((qkde(pnorm(Srho12 * G_Point7[l] + 
                sqrt(1 - Srho12^2) * G_Point7[k]), fhat2) - mu2)/s2)
        }
    }
    return(g)
  }



