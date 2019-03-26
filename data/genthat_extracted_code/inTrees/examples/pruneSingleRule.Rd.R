library(inTrees)


### Name: pruneSingleRule
### Title: internal
### Aliases: pruneSingleRule
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rule, X, target, maxDecay, typeDecay) 
{
    newRuleMetric <- measureRule(rule["condition"], X, target)
    errOrig <- as.numeric(newRuleMetric["err"])
    ruleV <- unlist(strsplit(rule["condition"], split = " & "))
    pred <- rule["pred"]
    if (length(ruleV) == 1) 
        return(newRuleMetric)
    for (i in length(ruleV):1) {
        restRule <- ruleV[-i]
        restRule <- paste(restRule, collapse = " & ")
        metricTmp <- measureRule(restRule, X, target, pred)
        errNew <- as.numeric(metricTmp["err"])
        if (typeDecay == 1) {
            decay <- (errNew - errOrig)/max(errOrig, 1e-06)
        }
        else {
            decay <- (errNew - errOrig)
        }
        if (decay <= maxDecay) {
            ruleV <- ruleV[-i]
            newRuleMetric <- metricTmp
            if (length(ruleV) <= 1) 
                break
        }
    }
    return(newRuleMetric)
  }



