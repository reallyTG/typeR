library(ff)


### Name: sortLevels
### Title: Factor level manipulation
### Aliases: appendLevels recodeLevels recodeLevels.factor recodeLevels.ff
###   sortLevels sortLevels.factor sortLevels.ff sortLevels.ffdf
### Keywords: attribute

### ** Examples

  message("Let's create a factor with little levels")
  x <- ff(letters[4:6], levels=letters[4:6])
  message("Let's interpret the same ff file without levels in order to see the codes")
  y <- x
  levels(y) <- NULL

  levels(x)
  data.frame(factor=x[], codes=y[])

  levels(x) <- appendLevels(levels(x), letters)
  levels(x)
  data.frame(factor=x[], codes=y[])

  x <- sortLevels(x) # implicit recoding is chunked were necessary
  levels(x)
  data.frame(factor=x[], codes=y[])

  message("NEVER forget to reassign the result of recodeLevels or sortLevels, 
look at the following mess")
  recodeLevels(x, rev(levels(x)))
  message("NOW the codings have changed, but not the levels, the result is wrong data")
  levels(x)
  data.frame(factor=x[], codes=y[])

  rm(x);gc()

## Not run: 
##D  n <- 5e7
##D 
##D  message("reading a factor from a file ist as fast ...")
##D  system.time(
##D  fx <- ff(factor(letters[1:25]), length=n)
##D  )
##D  system.time(x <- fx[])
##D  str(x)
##D  rm(x); gc()
##D 
##D 
##D  message("... as creating it in-RAM (R-2.11.1) which is theoretically impossible ...")
##D  system.time({
##D  x <- integer(n)
##D  x[] <- 1:25
##D  levels(x) <- letters[1:25]
##D  class(x) <- "factor"
##D  })
##D  str(x)
##D  rm(x); gc()
##D 
##D 
##D  message("... but is possible if we avoid some  unnecessary copying that is triggered 
##D by assignment functions")
##D  system.time({
##D  x <- integer(n)
##D  x[] <- 1:25
##D  setattr(x, "levels", letters[1:25])
##D  setattr(x, "class", "factor")
##D  })
##D  str(x)
##D  rm(x); gc()
##D 
##D  rm(n)
## End(Not run)




