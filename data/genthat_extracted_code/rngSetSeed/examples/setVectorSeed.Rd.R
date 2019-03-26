library(rngSetSeed)


### Name: setVectorSeed
### Title: Initialization of Mersenne-Twister RNG with a numeric vector of
###   an arbitrary nonzero length
### Aliases: setVectorSeed

### ** Examples

  setVectorSeed(1)
  x1 <- runif(5)
  setVectorSeed(c(1, 0))
  x2 <- runif(5)
  stopifnot(abs(x1 - c(0.30327915, 0.93045726, 0.20716215, 0.04424525, 0.07478261)) < 1e-8)
  stopifnot(abs(x2 - c(0.02231465, 0.80036017, 0.27630612, 0.69594674, 0.02688734)) < 1e-8)



