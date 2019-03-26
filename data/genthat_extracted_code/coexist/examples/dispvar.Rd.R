library(coexist)


### Name: dispvar
### Title: dispersal parameters' matrix
### Aliases: dispvar

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (island, rate = 0.5, scale = 2, type = "decrease") 
{
    dismat <- matrix(0, ncol = island, nrow = island)
    if (type == "decrease") {
        for (i in 1:as.integer((island - 1)/2)) {
            dismat[i, i + 1] = rate
        }
        for (i in (as.integer((island - 1)/2) + 1):(island - 
            1)) {
            dismat[i, i + 1] = rate/scale
        }
        diag(dismat) <- 1 - rowSums(dismat)
    }
    if (type == "increase") {
        for (i in 1:as.integer((island - 1)/2)) {
            dismat[i, i + 1] = rate/scale
        }
        for (i in (as.integer((island - 1)/2) + 1):(island - 
            1)) {
            dismat[i, i + 1] = rate
        }
        diag(dismat) <- 1 - rowSums(dismat)
    }
    if (type == "constant") {
        for (i in 1:(island - 1)) {
            dismat[i, i + 1] = rate
        }
        diag(dismat) <- 1 - rowSums(dismat)
    }
    if (type == "mosaiclow") {
        for (i in 1:(island - 1)) {
            if (i%%2 == 0) {
                dismat[i, i + 1] = rate
            }
            else {
                dismat[i, i + 1] = rate/scale
            }
        }
        diag(dismat) <- 1 - rowSums(dismat)
    }
    if (type == "mosaichigh") {
        for (i in 1:(island - 1)) {
            if (i%%2 == 0) {
                dismat[i, i + 1] = rate/scale
            }
            else {
                dismat[i, i + 1] = rate
            }
        }
        diag(dismat) <- 1 - rowSums(dismat)
    }
    return(dismat)
  }



