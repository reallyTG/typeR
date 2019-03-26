library(coexist)


### Name: comblist2
### Title: construct a full list of all combinations of parameters
### Aliases: comblist2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (parlist) 
{
    combnum = 1
    parnum <- length(parlist)
    lvector <- vector()
    length(lvector) <- parnum
    for (i in 1:parnum) {
        combnum <- length(parlist[[i]]) * combnum
        lvector[i] = length(parlist[[i]])
    }
    mat <- matrix(0, ncol = parnum, nrow = combnum)
    for (i in 1:parnum) {
        leg <- prod(lvector[i:parnum])/lvector[i]
        repeated = combnum/prod(lvector[i:parnum])
        fullcircle = leg * lvector[i]
        temp <- vector()
        length(temp) <- fullcircle
        for (k in 1:length(parlist[[i]])) {
            temp[((k - 1) * leg + 1):(k * leg)] = parlist[[i]][k]
        }
        for (ii in 1:repeated) {
            mat[((ii - 1) * fullcircle + 1):(ii * fullcircle), 
                i] = temp
        }
    }
    return(mat)
  }



