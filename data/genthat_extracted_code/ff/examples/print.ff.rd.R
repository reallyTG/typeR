library(ff)


### Name: print.ff
### Title: Print and str methods
### Aliases: print.ff print.ffdf print.ff_vector print.ff_matrix str.ff
###   str.ffdf
### Keywords: IO data print

### ** Examples

  x <- ff(1:10000)
  x
  print(x, maxlength=30)
  dim(x) <- c(100,100)
  x
  rm(x); gc()



