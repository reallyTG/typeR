library(coexist)


### Name: batch.mpaircomp
### Title: batch analysis to explore coexistence density for different
###   scenarios of a pair of parameters, for the case of multiple species
###   modeling
### Aliases: batch.mpaircomp

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistlist,coenum,spnum,parameters)
{
    if (is.list(coexistlist)) {
        scenarionum <- length(coexistlist)
        pairlist <- list()
        length(pairlist) <- scenarionum
        for (i in 1:scenarionum) {
            pairlist[[i]] <- sta.mpaircomparison(coexistlist[[i]], 
                coenum, spnum = spnum, parameters = parameters)
        }
        return(pairlist)
    }
  }



