library(coexist)


### Name: dispersal
### Title: perform dispersal analysis for each simulation time step for
###   2-species modeling
### Aliases: dispersal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (spvector, initp, dismat, allee = 1) 
{
    spvector <- spvector %*% dismat
    spvector[1, 1] = initp
    spvector[2, 1] = initp
    spvector[which(spvector < allee)] = 0
    return(spvector)
  }



