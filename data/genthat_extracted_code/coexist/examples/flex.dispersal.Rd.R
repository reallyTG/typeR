library(coexist)


### Name: flex.dispersal
### Title: perform species-specific dispersal and fluctuating source
###   analysis, for two or multiple species models, it's an internal
###   function
### Aliases: flex.dispersal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (spvector, initp,dismat, allee = 1, type = "constant") 
{
    if (type == "constant") {
        spnum <- length(dismat)
        for (i in 1:spnum) {
            spvector[i, ] <- spvector[i, ] %*% dismat[[i]]
            spvector[i, 1] = initp
        }
    }
    if (type == "flexible") {
        spnum <- length(dismat)
        for (i in 1:spnum) {
            spvector[i, ] <- spvector[i, ] %*% dismat[[i]]
            spvector[i, 1] = rnorm(1, mean = initp, sd = initp/10)
        }
    }
    if (type == "cochange") {
        spnum <- length(dismat)
        newresource <- rnorm(1, mean = initp, sd = initp/10)
        for (i in 1:spnum) {
            spvector[i, ] <- spvector[i, ] %*% dismat[[i]]
            spvector[i, 1] = newresource
        }
    }
    spvector[which(spvector < allee)] = 0
    spvector[which(spvector < 0)] = 0
    return(spvector)
  }



