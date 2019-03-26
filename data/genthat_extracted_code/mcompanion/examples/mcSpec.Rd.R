library(mcompanion)


### Name: mcSpec
### Title: Generate objects of class mcSpec
### Aliases: mcSpec initialize,mcSpec-method
### Keywords: methods

### ** Examples

spec2 <- mcSpec(21, 4, siorder=2, iorder=1)
spec4 <- mcSpec(11, 4, siorder=1, iorder=1)
spec.co2 <- mcSpec(dim = 5, mo = 4, siorder = 1)
spec.co2new <- mcSpec(dim = 5, mo = 4, siorder = 1) # after correcting ev.arg
spec.co2alt <- mcSpec(dim = 6, mo = 4, siorder = 1)

spec.co3 <- mcSpec(dim = 5, mo = 4, root1 = c(1,1,1))

spec.coz1 <- mcSpec(dim = 4, mo = 4, root1 = c(1,1), order = rep(2,4)) # test0 roots
spec.coz2 <- mcSpec(dim = 5, mo = 4, root1 = c(1,1), order = rep(2,4)) # test0 roots
spec.coz3 <- mcSpec(dim = 4, mo = 4, root1 = c(1), order = rep(2,4)) # test0 roots
spec.co4 <- mcSpec(dim = 4, mo = 4, root1 = c(1,1,1))



