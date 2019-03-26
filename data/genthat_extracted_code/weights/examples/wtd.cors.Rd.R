library(weights)


### Name: wtd.cors
### Title: Produces weighted correlations quickly using C.
### Aliases: wtd.cors
### Keywords: ~correlation ~Pearson ~weights

### ** Examples

test <- c(1,1,1,1,1,1,2,2,2,3,3,3,4,4)
t2 <- rev(test)
weight <- c(.5,.5,.5,.5,.5,1,1,1,1,2,2,2,2,2)

wtd.cors(test, t2)
wtd.cors(test, t2, weight)



