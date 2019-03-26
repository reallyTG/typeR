library(coexist)


### Name: sta.mcomparison
### Title: posterior different parameter rate comparison for a single
###   scenario of multiple-species modeling
### Aliases: sta.mcomparison

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistence, coenum, island, spnum, parameters = parspace) 
{
    comparisonlist <- list()
    length(comparisonlist) <- dim(coexistence)[2] - 2 * spnum
    conum <- matrix(0, ncol = length(parameters) + 1, nrow = island)
    colnames(conum) <- c("coe.num", paste("=", parameters, sep = ""))
    for (pars in 1:length(comparisonlist)) {
        for (i in 1:(island - 1)) {
            conum[i, 1] = island - i
            for (j in 1:length(parameters)) {
                conum[i, j + 1] <- length(which(coexistence[, 
                  spnum + coenum] == island - i & coexistence[, 
                  pars + 2 * spnum] == parameters[j]))
            }
        }
        for (j in 1:length(parameters)) {
            conum[island, j + 1] = length(which(coexistence[, 
                spnum + coenum] == parameters[j]))
        }
        comparisonlist[[pars]] <- conum
    }
    names(comparisonlist) <- colnames(coexistence[, (2 * spnum + 
        1):dim(coexistence)[2]])
    return(comparisonlist)
  }



