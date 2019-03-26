library(inTrees)


### Name: singleRuleList2Exec
### Title: internal
### Aliases: singleRuleList2Exec
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ruleList, typeX) 
{
    ruleExec <- ""
    vars <- ls(ruleList)
    vars <- vars[order(as.numeric(vars))]
    for (i in 1:length(vars)) {
        if (typeX[as.numeric(vars[i])] == 2) {
            values <- paste("c(", paste(paste("'", ruleList[[vars[i]]], 
                "'", sep = ""), collapse = ","), ")", sep = "")
            tmp = paste("X[,", vars[i], "] %in% ", values, sep = "")
        }
        else {
            tmp = ruleList[[vars[i]]]
        }
        if (i == 1) 
            ruleExec <- paste(ruleExec, tmp, sep = "")
        if (i > 1) 
            ruleExec <- paste(ruleExec, " & ", tmp, sep = "")
    }
    return(c(ruleExec))
  }



