library(cyphid)


### Name: get.peaks
### Title: A function to identify peaks within a dataset.
### Aliases: get.peaks

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, span = 40) 
  {
    z <- embed(rev(as.vector(x)), dim = span)
    z <- z[rev(seq(nrow(z))), ]
    s <- span%/%2
    v <- max.col(z, ties.method = "first") == 1 + s
    z <- c(rep(FALSE, s), v)
    ans <- c(z[1:(length(z) - s)], rep(FALSE, span - 1))
    nx <- NCOL(x)
    if (nx > 1) 
      matrix(ans, ncol = nx)
    else ans
  }



