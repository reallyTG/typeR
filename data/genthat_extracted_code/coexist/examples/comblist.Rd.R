library(coexist)


### Name: comblist
### Title: construct a full list of all combinations of parameters
### Aliases: comblist

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (parvector, parnum) 
{
    combnum <- length(parvector)^parnum
    mat <- matrix(0, ncol = parnum, nrow = combnum)
    for (i in 1:parnum) {
        leg <- length(parvector)^(parnum - i)
        period = length(parvector)^i
        repeated = length(parvector)^(i - 1)
        fullcircle = leg * length(parvector)
        temp <- vector()
        length(temp) <- fullcircle
        for (k in 1:length(parvector)) {
            temp[((k - 1) * leg + 1):(k * leg)] = parvector[k]
        }
        for (ii in 1:repeated) {
            mat[((ii - 1) * fullcircle + 1):(ii * fullcircle), 
                i] = temp
        }
    }
    return(mat)
  }



