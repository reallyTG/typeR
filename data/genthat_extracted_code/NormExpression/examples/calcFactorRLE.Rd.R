library(NormExpression)


### Name: calcFactorRLE
### Title: calcFactorRLE
### Aliases: calcFactorRLE
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, p = p)
{
    gm <- exp(rowMeans(.log(data), na.rm = TRUE))
    apply(data, 2, function(u) quantile((u/gm)[u != 0], na.rm = TRUE,
        p = p))
  }



