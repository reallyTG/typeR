library(inTrees)


### Name: voteAllRules
### Title: internal
### Aliases: voteAllRules
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (ruleMetric, X, type = "r", method = "median") 
{
    xVoteList = vector("list", nrow(X))
    predY <- rep("", nrow(X))
    for (i in 1:nrow(ruleMetric)) {
        ixMatch <- eval(parse(text = paste("which(", ruleMetric[i, 
            "condition"], ")")))
        if (length(ixMatch) == 0) 
            next
        for (ii in ixMatch) {
            xVoteList[[ii]] = c(xVoteList[[ii]], ruleMetric[i, 
                "pred"])
        }
    }
    for (i in 1:length(xVoteList)) {
        thisV <- xVoteList[[i]]
        if (length(thisV) == 0) 
            next
        if (type == "c") 
            predY[i] <- names(table(thisV)[which.max(table(thisV))])
        if (type == "r") {
            thisV = as.numeric(thisV)
            if (method == "median") {
                predY[i] <- median(thisV)
            }
            else {
                predY[i] <- mean(thisV)
            }
        }
    }
    if (type == "r") 
        predY <- as.numeric(predY)
    return(predY)
  }



