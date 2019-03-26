library(coexist)


### Name: batch.n2n
### Title: batch analysis of niche and neutral/nearly-neutral cases for two
###   or multiple species modeling
### Aliases: batch.n2n

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (colist,island) 
{
    resultlist <- list()
    scenarionum = length(colist)
    length(resultlist) <- scenarionum
    for (i in 1:scenarionum) {
        resultlist[[i]] <- sta.fitness(colist[[i]],island)
    }
    return(resultlist)
  }



