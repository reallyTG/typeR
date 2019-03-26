library(coexist)


### Name: make.parcomb
### Title: make the parameter combination index matrix
### Aliases: make.parcomb

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (prange, parnum, path = NULL) 
{
    if (!is.list(prange)) {
        parcomb <- comblist(prange, parnum)
    }
    if (is.list(prange)) {
        parcomb <- comblist2(prange)
    }
    if (length(path) != 0) {
        path = filename.check(path)
        write.table(parcomb, path, sep = "\t")
    }
    return(parcomb)
  }



