library(coexist)


### Name: batch.read
### Title: batch read different file data based on the order 1,2,3,4,5,6...
###   in a folder
### Aliases: batch.read

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (path = pathvector, index = NULL, spnum = 2, islandnum = 10) 
{
    num <- length(path)
    outlist <- list()
    length(outlist) <- num
    if (length(index) == 0) {
        for (i in 1:num) {
            outlist[[i]] <- read.patchdata(path = path[i], spnum = spnum, 
                islandnum = islandnum)
        }
    }
    if (length(index) != 0) {
        for (i in 1:num) {
            outlist[[i]] <- read.data(path = path[i], index = index, 
                spnum = spnum, islandnum = islandnum)
        }
    }
    return(outlist)
  }



