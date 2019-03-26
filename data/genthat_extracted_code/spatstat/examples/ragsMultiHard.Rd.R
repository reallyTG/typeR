library(spatstat)


### Name: ragsMultiHard
### Title: Alternating Gibbs Sampler for Multitype Hard Core Process
### Aliases: ragsMultiHard
### Keywords: spatial datagen

### ** Examples

  b <- c(30,20)
  h <- 0.05 * matrix(c(0,1,1,0), 2, 2)
  ragsMultiHard(b, h, ncycles=10)
  ragsMultiHard(b, h, ncycles=5, periodic=TRUE)



