library(MaskJointDensity)


### Name: rmulti
### Title: Simple way to generate noise
### Aliases: rmulti
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (n, mean, sd, p) 
{
    x <- rnorm(n)
    u <- sample(1:length(mean), n, prob = p, replace = T)
    for (i in 1:length(mean)) x[u == i] = mean[i] + sd[i] * x[u == 
        i]
    return(x)
  }



