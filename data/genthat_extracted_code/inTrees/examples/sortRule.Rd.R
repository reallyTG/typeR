library(inTrees)


### Name: sortRule
### Title: internal
### Aliases: sortRule
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (M, decreasing = TRUE) 
{
    qIx = order((1 - as.numeric(ruleMetric[, "err"])), as.numeric(ruleMetric[, 
        "freq"]), -as.numeric(ruleMetric[, "len"]), decreasing = decreasing)
    return(M[qIx, ])
  }



