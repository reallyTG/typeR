library(coexist)


### Name: batch.coexistence
### Title: batch anlaysis of coexistence summary tables
### Aliases: batch.coexistence

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (out, island = 10) 
{
    colist <- list()
    scenarionum <- length(out)
    length(colist) <- scenarionum
    for (i in 1:scenarionum) {
        colist[[i]] <- sta.coexistence(out[[i]], island)
    }
    return(colist)
  }



