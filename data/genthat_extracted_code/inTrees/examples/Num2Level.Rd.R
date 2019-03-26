library(inTrees)


### Name: Num2Level
### Title: internal function
### Aliases: Num2Level
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (rfList, splitV) 
{
    for (i in 1:rfList$ntree) {
        rfList$list[[i]] <- data.frame(rfList$list[[i]])
        rfList$list[[i]][, "prediction"] <- data.frame(dicretizeVector(rfList$list[[i]][, 
            "prediction"], splitV))
        colnames(rfList$list[[i]]) <- c("left daughter", "right daughter", 
            "split var", "split point", "status", "prediction")
    }
    return(rfList)
  }



