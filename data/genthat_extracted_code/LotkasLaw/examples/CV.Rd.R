library(LotkasLaw)


### Name: CV
### Title: Runs Critical Value
### Aliases: CV
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Sums) 
{
    bottom <- sqrt(Sums[2])
    top <- 1.63
    answer <- top/bottom
    return(answer)
  }



