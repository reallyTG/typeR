library(inTrees)


### Name: rule2Table
### Title: internal function
### Aliases: rule2Table
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ruleExec, X, target) 
{
    I <- rep(0, nrow(X))
    ruleExec <- paste("which(", ruleExec, ")")
    ixMatch <- eval(parse(text = ruleExec))
    if (length(ixMatch) > 0) 
        I[ixMatch] <- 1
    names(I) = NULL
    return(I)
  }



