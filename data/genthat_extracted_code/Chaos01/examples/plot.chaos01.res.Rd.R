library(Chaos01)


### Name: plot.chaos01.res
### Title: Plot Kc based on c
### Aliases: plot.chaos01.res
### Keywords: chaos plot test

### ** Examples

vec.x <- gen.logistic(mu = 3.55, iter = 2000)

#Output for each value of c
res2 <- testChaos01(vec.x, out = TRUE)

plot(res2)



