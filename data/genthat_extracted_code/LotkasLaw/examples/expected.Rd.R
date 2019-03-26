library(LotkasLaw)


### Name: expected
### Title: Runs Expected Authors from table
### Aliases: expected
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Table, C, N) 
{
    value <- Table[,1:1]^N
    nvalue <- 1/value
    part2 <- C*nvalue
    return(part2)
  }



