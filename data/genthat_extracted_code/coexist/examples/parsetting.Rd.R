library(coexist)


### Name: parsetting
### Title: rate vector for each species at each island, called widely by
###   other functions
### Aliases: parsetting

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (island, rate = 1, scale = 2, type = "decrease") 
{
    parset <- vector()
    length(parset) <- island
    if (type == "decrease") {
        parset[1:as.integer(island/2)] = rate
        parset[(as.integer(island/2) + 1):island] = rate/scale
    }
    if (type == "increase") {
        parset[1:as.integer(island/2)] = rate/scale
        parset[(as.integer(island/2) + 1):island] = rate
    }
    if (type == "constant") {
        parset[1:island] = rate
    }
    if (type == "mosaiclow") {
        for (i in 1:island) {
            if (i%%2 == 0) {
                parset[i] = rate
            }
            else {
                parset[i] = rate/scale
            }
        }
    }
    if (type == "mosaichigh") {
        for (i in 1:island) {
            if (i%%2 == 0) {
                parset[i] = rate/scale
            }
            else {
                parset[i] = rate
            }
        }
    }
    return(parset)
  }



