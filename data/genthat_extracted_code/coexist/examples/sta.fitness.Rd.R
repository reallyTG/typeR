library(coexist)


### Name: sta.fitness
### Title: fitness/abundance comparison for neutral versus niche cases for
###   2-species modeling
### Aliases: sta.fitness

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistence) 
{
    neutral <- coexistence[which(coexistence[, 4] == coexistence[, 
        5]), ]
    niche <- coexistence[which(coexistence[, 4] != coexistence[, 
        5]), ]
    neutral.num <- dim(neutral)[1]
    niche.num <- dim(niche)[1]
    conum <- matrix(0, ncol = 2, nrow = island)
    colnames(conum) <- c("neutral", "niche")
    for (i in 1:(island - 1)) {
        conum[i, 1] <- length(which(neutral[, 3] == island - 
            i))
        conum[i, 2] <- length(which(niche[, 3] == island - i))
    }
    conum[island, 1] = neutral.num
    conum[island, 2] = niche.num
    return(conum)
  }



