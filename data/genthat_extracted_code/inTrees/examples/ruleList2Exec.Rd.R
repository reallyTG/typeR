library(inTrees)


### Name: ruleList2Exec
### Title: internal
### Aliases: ruleList2Exec
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (X, allRulesList) 
{
    typeX = getTypeX(X)
    ruleExec <- unique(t(sapply(allRulesList, singleRuleList2Exec, 
        typeX = typeX)))
    ruleExec <- t(ruleExec)
    colnames(ruleExec) <- "condition"
    return(ruleExec)
  }



