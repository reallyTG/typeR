library(RDieHarder)


### Name: dieharder
### Title: Random numebr generator test suite
### Aliases: dieharder dieharder.default print.dieharder plot.dieharder
###   summary.dieharder dieharderGenerators dieharderTests
### Keywords: misc

### ** Examples

  ## need to set this for the example to pass the R CMD check test
  .dieharder.generators <<- dieharderGenerators()
  dh <- dieharder(41, 15, seed=12345) # randu and diehard_runs
  dh
  summary(dh)
  plot(dh)



