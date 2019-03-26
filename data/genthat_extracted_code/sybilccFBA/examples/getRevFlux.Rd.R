library(sybilccFBA)


### Name: getRevFlux
### Title: getRevFlux
### Aliases: getRevFlux
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (model, modirrev, fdirrev) 
{
    fluxes = NULL
    for (r in (react_id(model))) {
        if (!react_rev(model)[react_id(model) == r]) {
            fluxes = rbind(fluxes, cbind(rxn = r, fwd = fdirrev[which(react_id(modirrev) == 
                r)], bwd = 0))
        }
        else {
            fluxes = rbind(fluxes, cbind(rxn = r, fwd = fdirrev[which(react_id(modirrev) == 
                paste(r, "_f", sep = ""))], bwd = fdirrev[which(react_id(modirrev) == 
                paste(r, "_b", sep = ""))]))
        }
    }
    return(fluxes)
  }



