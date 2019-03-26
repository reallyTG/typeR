library(daewr)


### Name: gapstat
### Title: This function computes the gap statistic which is used to test
###   for an outlier using Daniels method
### Aliases: gapstat
### Keywords: htest

### ** Examples


## The function is currently defined as
function (beta, pse) 
{
    p <- length(beta)
    psehe <- pse
    sel <- beta >= 0
    betap <- beta[sel]
    betap <- sort(betap)
    betas <- betap[1]
    sel <- beta < 0
    betan <- beta[sel]
    nn <- length(betan)
    betan <- sort(betan)
    betal <- betan[nn]
    zl <- qnorm((nn - 0.375)/(p + 0.25))
    zs <- qnorm((nn + 1 - 0.375)/(p + 0.25))
    gap <- ((betas - betal)/psehe)/(zs - zl)
    return(gap)
  }



