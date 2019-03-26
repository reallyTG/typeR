library(mgpd)


### Name: mgpd_init
### Title: internal
### Aliases: mgpd_init
### Keywords: internal

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (xdat) 
{
    p = NULL
    for (i in 1:dim(xdat)[2]) p = c(p, fgev(xdat[, i], std.err = FALSE)[[1]])
    p
  }



