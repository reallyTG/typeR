library(LotkasLaw)


### Name: LotkasLogX
### Title: Generate a Log 10(of X from Table)
### Aliases: LotkasLogX
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Table) 
{
    value <- log(Table[, 1:1], base = 10)
    return(value)
  }



