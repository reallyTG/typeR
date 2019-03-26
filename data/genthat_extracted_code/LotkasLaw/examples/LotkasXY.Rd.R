library(LotkasLaw)


### Name: LotkasXY
### Title: Multiplies Log base 10 of X and Log base 10 of Y
### Aliases: LotkasXY
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Table) 
{
    value <- (Table[, 3:3] * Table[, 4:4])
    return(value)
  }



