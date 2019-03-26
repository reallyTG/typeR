library(coexist)


### Name: batch.onepar
### Title: batch analysis to explore coexistence density for handling
###   multiple model scenarios outputs for a varying parameter, for
###   2-species model
### Aliases: batch.onepar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistlist, parameters = parspace) 
{
    scenarionum <- length(coexistlist)
    pairlist <- list()
    length(pairlist) <- scenarionum
    for (i in 1:scenarionum) {
        pairlist[[i]] <- sta.comparison(coexistlist[[i]], parameters = parameters)
    }
    return(pairlist)
  }



