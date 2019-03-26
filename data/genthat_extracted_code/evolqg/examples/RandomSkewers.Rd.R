library(evolqg)


### Name: RandomSkewers
### Title: Compare matrices via RandomSkewers
### Aliases: RandomSkewers RandomSkewers.default RandomSkewers.list
###   RandomSkewers.mcmc_sample
### Keywords: matrixcomparison matrixcorrelation randomskewers

### ** Examples

c1 <- RandomMatrix(10, 1, 1, 10)
c2 <- RandomMatrix(10, 1, 1, 10)
c3 <- RandomMatrix(10, 1, 1, 10)
RandomSkewers(c1, c2)

RandomSkewers(list(c1, c2, c3))

reps <- unlist(lapply(list(c1, c2, c3), MonteCarloRep, sample.size = 10,
                                        RandomSkewers, num.vectors = 100, 
                                        iterations = 10))
RandomSkewers(list(c1, c2, c3), repeat.vector = reps)

c4 <- RandomMatrix(10)
RandomSkewers(list(c1, c2, c3), c4)

#Multiple threads can be used with some foreach backend library, like doMC or doParallel
#library(doParallel)
##Windows:
#cl <- makeCluster(2)
#registerDoParallel(cl)
##Mac and Linux:
#registerDoParallel(cores = 2)
#RandomSkewers(list(c1, c2, c3), parallel = TRUE)




