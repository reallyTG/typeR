library(NormExpression)


### Name: estimateSizeFactorsForMatrix
### Title: estimateSizeFactorsForMatrix
### Aliases: estimateSizeFactorsForMatrix
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, p = p)
{
    loggeomeans <- rowMeans(.log(data), na.rm = TRUE)
    apply(data, 2, function(cnts) exp(quantile(.log(cnts) - loggeomeans,
        na.rm = TRUE, p = p)))
  }



