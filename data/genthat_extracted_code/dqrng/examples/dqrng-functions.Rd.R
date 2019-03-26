library(dqrng)


### Name: dqRNGkind
### Title: R interface
### Aliases: dqRNGkind dqrunif dqrnorm dqrexp dqset.seed

### ** Examples

library(dqrng)
dqRNGkind("Xoroshiro128+")
dqset.seed(42)
dqrunif(5, min = 2, max = 10)
dqrexp(5, rate = 4)
dqrnorm(5, mean = 5, sd = 3)



