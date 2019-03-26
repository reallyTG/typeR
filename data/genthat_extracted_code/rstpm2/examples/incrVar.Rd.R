library(rstpm2)


### Name: incrVar
### Title: Utility that returns a function to increment a variable in a
###   data-frame.
### Aliases: incrVar
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (var, increment = 1) 
{
    n <- length(var)
    if (n > 1 && length(increment)==1) 
        increment <- rep(increment, n)
    function(data) {
        for (i in 1:n) {
            data[[var[i]]] <- data[[var[i]]] + increment[i]
        }
        data
    }
  }



