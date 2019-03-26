library(MESS)


### Name: cumsumbinning
### Title: Binning based on cumulative sum with reset above threshold
### Aliases: cumsumbinning

### ** Examples


set.seed(1)
x <- sample(10, 20, replace = TRUE)
cumsumbinning(x, 15)
cumsumbinning(x, 15, 3)




