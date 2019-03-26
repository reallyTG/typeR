library(NormExpression)


### Name: filteredZero
### Title: filteredZero
### Aliases: filteredZero
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, nonzeroRatio)
{
    nozeroCount <- apply(data, 1, function(x) length(which(x !=
        0)))
    geneIndex <- which(nozeroCount >= ncol(data) * nonzeroRatio)
    return(geneIndex)
  }



