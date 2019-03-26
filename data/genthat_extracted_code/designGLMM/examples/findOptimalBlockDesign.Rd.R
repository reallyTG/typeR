library(designGLMM)


### Name: findOptimalBlockDesign
### Title: Find an efficient block design for a Poisson GLMM
### Aliases: findOptimalBlockDesign

### ** Examples


## Constructing a D-optimal block design with 4 blocks of size 3 with seven treatments
## with means c(5,5.5,6,5.5,7,10,4) with between block standard deviation 0.3
## and no overdispersion (sigma=0). In each round of simulated annealing, we use 1000
## iterations

findOptimalBlockDesign(numblock = 4, blksize = 3, means = c(5,5.5,6,5.5,7,10,4),
  sigma = 0, sigmaB = 0.3,iter=1000)

## Constructing an A-optimal design with the same means

findOptimalBlockDesign(numblock = 4, blksize = 3, means = c(5,5.5,6,5.5,7,10,4),
  sigma = 0, sigmaB = 0.3, criterion = "A",iter=1000)




