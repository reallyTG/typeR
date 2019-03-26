library(metaMA)


### Name: rowVars
### Title: Row variance of an array
### Aliases: rowVars
### Keywords: methods models

### ** Examples

## The function is currently defined as
function (x,na.rm = TRUE) 
{
    sqr = function(x) x * x
    n = rowSums(!is.na(x))
    n[n <= 1] = NA
    return(rowSums(sqr(x - rowMeans(x,na.rm = na.rm)), na.rm = na.rm)/(n - 1))
  }



