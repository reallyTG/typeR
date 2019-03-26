library(ZIBseq)


### Name: calc_qvalues
### Title: a function used to calculate q values
### Aliases: calc_qvalues
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (pvalues) 
{
    nrows = length(pvalues)
    lambdas <- seq(0, 0.95, 0.01)
    pi0_hat <- array(0, dim = c(length(lambdas)))
    for (l in 1:length(lambdas)) {
        count = 0
        for (i in 1:nrows) {
            if (pvalues[i] > lambdas[l]) {
                count = count + 1
            }
            pi0_hat[l] = count/(nrows * (1 - lambdas[l]))
        }
    }
    f <- unclass(smooth.spline(lambdas, pi0_hat, df = 3))
    f_spline <- f$y
    pi0 = f_spline[length(lambdas)]
    ordered_ps <- order(pvalues)
    pvalues <- pvalues
    qvalues <- array(0, dim = c(nrows))
    ordered_qs <- array(0, dim = c(nrows))
    ordered_qs[nrows] <- min(pvalues[ordered_ps[nrows]] * pi0, 
        1)
    for (i in (nrows - 1):1) {
        p = pvalues[ordered_ps[i]]
        new = p * nrows * pi0/i
        ordered_qs[i] <- min(new, ordered_qs[i + 1], 1)
    }
    for (i in 1:nrows) {
        qvalues[ordered_ps[i]] = ordered_qs[i]
    }
    return(qvalues)
  }



