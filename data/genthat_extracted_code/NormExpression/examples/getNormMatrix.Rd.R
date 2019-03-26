library(NormExpression)


### Name: getNormMatrix
### Title: getNormMatrix
### Aliases: getNormMatrix
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, norm.factors)
{
    data * matrix(rep(norm.factors, dim(data)[1]), nrow = dim(data)[1],
        ncol = length(norm.factors), byrow = T)
  }



