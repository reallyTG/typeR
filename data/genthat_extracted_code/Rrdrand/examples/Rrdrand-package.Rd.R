library(Rrdrand)


### Name: Rrdrand-package
### Title: DRNG(Digital Random Numbers Generate) on Intel CPUs with the
###   RdRand instruction for R
### Aliases: hasRDRAND
### Keywords: utilities

### ** Examples

  library(Rrdrand)
  if(hasRDRAND())
    print(RNGkind())
    print(runif(3))



