library(MaskJointDensity)


### Name: qkdeSorted
### Title: A slightly altered version of qkde from package ks
### Aliases: qkdeSorted
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (p, fhat) 
{
    if (any(p > 1) | any(p < 0)) 
        stop("p must be <= 1 and >= 0")
    cumul.prob <- pkde(q = fhat$eval.points, fhat = fhat)
    ind <- findIntervalSorted(x = p, vec = cumul.prob)
    quant <- rep(0, length(ind))
    for (j in 1:length(ind)) {
        i <- ind[j]
        if (i == 0) 
            quant[j] <- fhat$eval.points[1]
        else if (i >= length(fhat$eval.points)) 
            quant[j] <- fhat$eval.points[length(fhat$eval.points)]
        else {
            quant1 <- fhat$eval.points[i]
            quant2 <- fhat$eval.points[i + 1]
            prob1 <- cumul.prob[i]
            prob2 <- cumul.prob[i + 1]
            alpha <- (p[j] - prob2)/(prob1 - prob2)
            quant[j] <- quant1 * alpha + quant2 * (1 - alpha)
        }
    }
    return(quant)
  }



