library(mgpd)


### Name: fbgpd
### Title: internal
### Aliases: fbgpd
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (initpar, dat, model = "log", fixed = FALSE, control = list(maxit = 50000), 
    psi = 3, ...) 
{
    est = optim(initpar, bgpd_maxlik, dat = dat, model = model, 
        control = control, fixed = fixed, psi = psi)
    if (fixed == TRUE) 
        est$par[1] = 0
    est
  }



