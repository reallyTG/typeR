library(spatstat)


### Name: rags
### Title: Alternating Gibbs Sampler for Multitype Point Processes
### Aliases: rags
### Keywords: spatial datagen

### ** Examples

  mo <- list(beta=c(30, 20),
             hradii = 0.05 * matrix(c(0,1,1,0), 2, 2))
  rags(mo, ncycles=10)



