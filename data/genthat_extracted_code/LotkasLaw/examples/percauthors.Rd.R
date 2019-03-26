library(LotkasLaw)


### Name: percauthors
### Title: Runs a Percent of Authors Total from the table.
### Aliases: percauthors
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (Table, Sums) 
{
    justy <- Table[, 2:2]
    newcol <- justy/Sums[2]
    return(newcol)
  }



