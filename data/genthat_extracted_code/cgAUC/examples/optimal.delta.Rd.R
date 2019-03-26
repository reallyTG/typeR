library(cgAUC)


### Name: optimal.delta
### Title: optimal.delta
### Aliases: optimal.delta
### Keywords: optimal.delta

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (y, z, l, h, ind.d.l) 
{
    l.i = matrix(rep(l, times = 50), nrow = 50, byrow = TRUE)
    delta = seq(0, 5, length = 50)
    m = delta %*% t(ind.d.l)
    l.i = l.i + m
    l.i.max = apply(l.i, 1, max)
    l.i = l.i/l.i.max
    theta = rep(0, 50)
    for (i in 2:50) {
        theta[i] = cntin(y, z, l.i[i, ], h)$theta.sh.h.p
    }
    delta.star = delta[which(theta == max(theta))]
    return(delta.star)
  }



