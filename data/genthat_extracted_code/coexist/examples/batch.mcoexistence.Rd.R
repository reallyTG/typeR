library(coexist)


### Name: batch.mcoexistence
### Title: batch anlaysis of multiple coexistence summary tables, the batch
###   form for sta.mcoexistence() function
### Aliases: batch.mcoexistence

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (out, island = island, spnum = 2) 
{
    colist <- list()
    scenarionum <- length(out)
    length(colist) <- scenarionum
    for (i in 1:scenarionum) {
        colist[[i]] <- sta.mcoexistence(out[[i]], island = island, 
            spnum = spnum)
    }
    return(colist)
  }



