library(spatstat.utils)


### Name: splat
### Title: Print Text Within Margins
### Aliases: splat
### Keywords: print utilities

### ** Examples

  op <- options(width=20)
  splat("There is more than one way to skin a cat.")
  splat("There is more than one", "way to skin a cat.", indent=5)

  options(width=10)
  splat("The value of pi is", pi)
  splat("The value of pi is", signif(pi))
  options(op)



