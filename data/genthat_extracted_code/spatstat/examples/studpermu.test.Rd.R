library(spatstat)


### Name: studpermu.test
### Title: Studentised Permutation Test
### Aliases: studpermu.test
### Keywords: spatial htest

### ** Examples

  np <- if(interactive()) 99 else 19
  testpyramidal <- studpermu.test(pyramidal, Neurons ~ group, nperm=np)
  testpyramidal



