library(LotkasLaw)


### Name: CVm
### Title: Runs Critical Value based on custom value
### Aliases: CVm
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (value, Sums) 
{
    bottom <- sqrt(Sums[2])
    top <- value
    answer <- top/bottom
    return(answer)
  }



