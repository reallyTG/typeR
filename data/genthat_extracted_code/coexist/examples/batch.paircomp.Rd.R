library(coexist)


### Name: batch.paircomp
### Title: batch analysis to explore coexistence density for handling
###   different model scenarios for two focused parameters,for 2-species
###   model
### Aliases: batch.paircomp

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistlist, parnum = parnum, parameters = parspace) 
{
    scenarionum <- length(coexistlist)
    pairlist <- list()
    length(pairlist) <- scenarionum
    for (i in 1:scenarionum) {
        pairlist[[i]] <- sta.paircomparison(coexistlist[[i]], 
            parnum = parnum, parameters = parameters)
    }
    return(pairlist)
  }



