library(timeordered)


### Name: swap
### Title: Swaps two elements in a data frame. An internal function.
### Aliases: swap
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (df, r1, c1, r2, c2) 
{
    tmp <- df[r1, c1]
    df[r1, c1] <- df[r2, c2]
    df[r2, c2] <- tmp
    return(df)
  }



