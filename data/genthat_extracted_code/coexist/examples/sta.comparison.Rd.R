library(coexist)


### Name: sta.comparison
### Title: posterior different parameter rate comparison for a single
###   scenario of 2-species modeling
### Aliases: sta.comparison
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistence, parameters,island) 
{
    comparisonlist <- list()
    length(comparisonlist) <- dim(coexistence)[2] - 3
    conum <- matrix(0, ncol = length(parameters) + 1, nrow = island)
    for (pars in 1:length(comparisonlist)) {
        for (i in 1:(island - 1)) {
            conum[i, 1] = island - i
            for (j in 1:length(parameters)) {
                conum[i, j + 1] <- length(which(coexistence[, 
                  3] == island - i & coexistence[, pars + 3] == 
                  parameters[j]))
            }
        }
        for (j in 1:length(parameters)) {
            conum[island, j + 1] = length(which(coexistence[, 
                pars + 3] == parameters[j]))
        }
        comparisonlist[[pars]] <- conum
    }
    names(comparisonlist) <- colnames(coexistence[, 4:dim(coexistence)[2]])
    return(comparisonlist)
  }



