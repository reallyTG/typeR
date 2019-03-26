library(rv)


### Name: sims
### Title: Retrieve the Simulations of Random Vectors
### Aliases: sims sims.rv sims.rvsummary sims.default
### Keywords: classes

### ** Examples


  setnsims(n.sims=2500)
  x <- rvnorm(24)
  dim(x) <- c(2,3,4)
  dim(sims(x))                  # 2500x24
  dim(sims(x, dimensions=TRUE)) # 2500x2x3x4




