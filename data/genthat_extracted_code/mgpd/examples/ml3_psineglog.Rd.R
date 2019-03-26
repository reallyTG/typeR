library(mgpd)


### Name: ml3_psineglog
### Title: internal
### Aliases: ml3_psineglog
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (param, dat, mlmax = 1e+15, fixed = FALSE, checkconv = TRUE, 
    ...) 
{
    loglik = mlmax
    lik = NULL
    x = dat[, 1]
    y = dat[, 2]
    z = dat[, 3]
    if (fixed) 
        param[1] = 0
    lik = try(dtgpd_psineglog(x, y, z, mar1 = param[1:3], mar2 = param[4:6], 
        mar3 = param[7:9], dep = param[10], A1 = param[11], A2 = param[12], 
        B1 = param[13], B2 = param[14], checkconv = checkconv))
    if (!is.null(lik)) {
        loglik = -sum(log(lik))
        if (min(1 + param[3] * (x - param[1])/param[2]) < 0) 
            loglik = mlmax
        if (min(1 + param[6] * (y - param[4])/param[5]) < 0) 
            loglik = mlmax
        if (min(1 + param[9] * (z - param[7])/param[8]) < 0) 
            loglik = mlmax
    }
    loglik
  }



