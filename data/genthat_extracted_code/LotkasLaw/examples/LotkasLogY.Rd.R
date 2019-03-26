library(LotkasLaw)


### Name: LotkasLogY
### Title: Generates a Table of Log base 10 of Y
### Aliases: LotkasLogY
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Table) 
{
    value <- log(Table[, 2:2], base = 10)
    return(value)
  }



