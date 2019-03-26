library(coexist)


### Name: spabundance
### Title: initialization of species' abundance across the patches/islands
### Aliases: spabundance

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (island, abund = 1000) 
{
    sabund <- vector()
    length(sabund) <- island
    sabund[1] = abund
    sabund[2:island] = 0
    return(sabund)
  }



