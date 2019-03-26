library(inTrees)


### Name: lookupRule
### Title: internal
### Aliases: lookupRule
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rules, strList) 
{
    ix <- grep(strList[1], rules[, "condition"])
    if (length(strList) >= 2) {
        for (i in 2:length(strList)) {
            ix2 <- grep(strList[i], rules[, "condition"])
            ix <- intersect(ix, ix2)
        }
    }
    if (length(ix) >= 1) 
        return(rules[ix, , drop = FALSE])
    if (length(ix) == 0) 
        return(NULL)
  }



