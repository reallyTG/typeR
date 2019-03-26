library(NormExpression)


### Name: calcFactorUpperquartile
### Title: calcFactorUpperquartile
### Aliases: calcFactorUpperquartile
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, lib.size, p = p)
{
    y <- t(t(data)/lib.size)
    f <- apply(y, 2, function(x) quantile(x[x != 0], p = p))
  }



