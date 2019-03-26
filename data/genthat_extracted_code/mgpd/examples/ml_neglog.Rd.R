library(mgpd)


### Name: ml_neglog
### Title: internal
### Aliases: ml_neglog
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (param, dat, mlmax = 1e+15, fixed = FALSE, ...) 
{
    loglik = mlmax
    lik = NULL
    x = dat[, 1]
    y = dat[, 2]
    if (fixed) 
        param[1] = 0
    lik = try(dbgpd(x, y, model = "neglog", mar1 = param[1:3], 
        mar2 = param[4:6], dep = param[7]))
    if (!is.null(lik)) {
        loglik = -sum(log(lik))
    }
    loglik
  }



