library(Chaos01)


### Name: plot.chaos01
### Title: Plot the additional results of 0-1 test for chaos.
### Aliases: plot.chaos01
### Keywords: chaos plot test

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

#Output for each value of c
res2 <- testChaos01(vec.x, out = TRUE)

plot(res2[[1]], plotvar = c("PQ", "MD"), mdcol = c(4,3))



