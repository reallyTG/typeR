library(sensR)


### Name: discrimSim
### Title: Simulates replicated difference tests
### Aliases: discrimSim
### Keywords: models

### ** Examples


## Running simulations:
discrimSim(sample.size = 10, replicates = 3, d.prime = 2,
           method = "triangle", sd.indiv = 1)
## Don't show: 
set.seed(1)
a <- discrimSim(sample.size = 10, replicates = 3, d.prime = 2,
           method = "triangle", sd.indiv = 1)
expect <- c(3L, 3L, 2L, 3L, 3L, 1L, 3L, 3L, 1L, 2L)
stopifnot(all(a == expect))
## End(Don't show)



