library(coexist)


### Name: batch.monepar
### Title: batch analysis to explore multiple species coexistence density
###   for a varying parameter under multiple-species modeling
### Aliases: batch.monepar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistlist, coenum, island, spnum, parameters) 
{
    if (is.list(coexistlist)) {
        scenarionum <- length(coexistlist)
        pairlist <- list()
        length(pairlist) <- scenarionum
        for (i in 1:scenarionum) {
            pairlist[[i]] <- sta.mcomparison(coexistlist[[i]], 
                coenum, island, spnum, parameters = parameters)
        }
        return(pairlist)
    }
  }



