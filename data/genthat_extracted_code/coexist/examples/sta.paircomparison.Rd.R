library(coexist)


### Name: sta.paircomparison
### Title: pairwise parameter comparison for 2-species model
### Aliases: sta.paircomparison

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistence, parnum = parnum, parameters = parspace) 
{
    comparisonlist <- list()
    length(comparisonlist) <- parnum * (parnum - 1)/2
    varlist <- comparisonlist
    namesvector <- vector()
    length(namesvector) <- length(comparisonlist)
    count = 0
    for (p1 in 1:(parnum - 1)) {
        for (p2 in (p1 + 1):parnum) {
            conum <- matrix(0, ncol = length(parameters), nrow = length(parameters))
            varmat <- conum
            count = count + 1
            for (i in 1:length(parameters)) {
                for (j in 1:length(parameters)) {
                  temp <- coexistence[which(coexistence[, 3 + 
                    p1] == parameters[i] & coexistence[, 3 + 
                    p2] == parameters[j]), ]
                  conum[i, j] <- mean(temp[, 3])
                  varmat[i, j] <- var(temp[, 3])
                }
            }
            comparisonlist[[count]] <- conum
            namesvector[count] <- paste(colnames(coexistence)[3 + 
                p1], colnames(coexistence)[3 + p2], sep = "-")
            varlist[[count]] <- varmat
        }
    }
    names(comparisonlist) <- namesvector
    names(varlist) <- namesvector
    return(list(mean = comparisonlist, var = varlist))
  }



