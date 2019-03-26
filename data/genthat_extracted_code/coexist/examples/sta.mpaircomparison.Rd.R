library(coexist)


### Name: sta.mpaircomparison
### Title: pairwise parameter comparison for multiple species with multiple
###   parameter space
### Aliases: sta.mpaircomparison

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (coexistence, coenum, spnum, parameters = parspace) 
{
    if (coenum > spnum | coenum <= 1) {
        cat("wrong number", "\n")
        coenum = spnum
    }
    parnum <- dim(coexistence)[2] - 2 * spnum
    comparisonlist <- list()
    length(comparisonlist) <- parnum * (parnum - 1)/2
    varlist <- comparisonlist
    namesvector <- vector()
    length(namesvector) <- length(comparisonlist)
    count = 0
    for (p1 in 1:(parnum - 1)) {
        for (p2 in (p1 + 1):parnum) {
            if (!is.list(parameters)) {
                conum <- matrix(0, ncol = length(parameters), 
                  nrow = length(parameters))
                colnames(conum) = paste("=", parameters, sep = "")
                rownames(conum) = paste("=", parameters, sep = "")
                varmat <- conum
                count = count + 1
                for (i in 1:length(parameters)) {
                  for (j in 1:length(parameters)) {
                    temp <- coexistence[which(coexistence[, 2 * 
                      spnum + p1] == parameters[i] & coexistence[, 
                      2 * spnum + p2] == parameters[j]), ]
                    if (length(temp) == 0) {
                      conum[i, j] = 0
                      varmat[i, j] = 0
                    }
                    else {
                      conum[i, j] <- mean(temp[, spnum + coenum])
                      varmat[i, j] <- var(temp[, spnum + coenum])
                    }
                  }
                }
            }
            else {
                conum <- matrix(0, ncol = length(parameters[[p2]]), 
                  nrow = length(parameters[[p1]]))
                colnames(conum) = paste("=", parameters[[p2]], 
                  sep = "")
                rownames(conum) = paste("=", parameters[[p1]], 
                  sep = "")
                varmat <- conum
                count = count + 1
                for (i in 1:length(parameters[[p2]])) {
                  for (j in 1:length(parameters[[p1]])) {
                    temp <- coexistence[which(coexistence[, 2 * 
                      spnum + p1] == parameters[[p2]][i] & coexistence[, 
                      2 * spnum + p2] == parameters[[p1]][j]), 
                      ]
                    if (length(temp) == 0) {
                      conum[i, j] = 0
                      varmat[i, j] = 0
                    }
                    else {
                      conum[i, j] <- mean(temp[, spnum + coenum])
                      varmat[i, j] <- var(temp[, spnum + coenum])
                    }
                  }
                }
            }
            comparisonlist[[count]] <- conum
            namesvector[count] <- paste(colnames(coexistence)[2 * 
                spnum + p1], colnames(coexistence)[2 * spnum + 
                p2], sep = "-")
            varlist[[count]] <- varmat
        }
    }
    names(comparisonlist) <- namesvector
    names(varlist) <- namesvector
    return(list(mean = comparisonlist, var = varlist))
  }



