library(coexist)


### Name: read.patchdata
### Title: read species abundance data from the patches, an internal
###   function
### Aliases: read.patchdata

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (path = NULL, spnum = 2, islandnum = island) 
{
    if (length(path) != 0) {
        raw <- scan(path, what = character(), sep = "\t")
        fileline <- length(count.fields(path))
        outlist <- list()
        length(outlist) <- fileline/(spnum + 1)
        sp <- matrix(0, nrow = spnum, ncol = islandnum)
        count = 0
        for (i in 1:length(raw)) {
            if (raw[i] == "V1") {
                count = count + 1
                for (j in 1:spnum) {
                  sp[j, ] = as.numeric(raw[(i + 10 + j + (j - 
                    1) * islandnum):(i + 10 + j - 1 + j * islandnum)])
                }
                outlist[[count]] <- list(abund = sp)
            }
        }
    }
    return(outlist)
  }



