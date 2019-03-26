library(coexist)


### Name: compvar
### Title: competition parameters' matrix
### Aliases: compvar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (island, rate = 0.5, scale = 2, type = "constant") 
{
    comp <- matrix(0, ncol = island, nrow = 2)
    comp[1, ] = parsetting(island, rate, scale, type)
    comp[2, ] = 1 - comp[1, ]
    return(comp)
  }



