library(secr)


### Name: secrRNG
### Title: Random Number Seed
### Aliases: 'random numbers' seed secrRNG
### Keywords: datagen

### ** Examples


## Not run: 
##D 
##D lmfit <- lm(speed ~ dist, data = cars)
##D 
##D ## 1. NULL seed
##D r1 <- simulate(lmfit, seed = NULL)
##D r2 <- simulate(lmfit, seed = NULL)
##D ## restore RNGstate, assuming RNGkind unchanged
##D .Random.seed <- attr(r1, "seed")
##D r3 <- simulate(lmfit, seed = NULL)
##D r1[1:6,1]
##D r2[1:6,1]
##D r3[1:6,1]
##D 
##D ## 2. explicit seed
##D r4 <- simulate(lmfit, seed = 123)
##D r5 <- simulate(lmfit, seed = attr(r4, "seed"))
##D r4[1:6,1]
##D r5[1:6,1]
##D 
## End(Not run)




