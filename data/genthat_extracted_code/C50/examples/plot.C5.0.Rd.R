library(C50)


### Name: plot.C5.0
### Title: Plot a decision tree
### Aliases: plot.C5.0
### Keywords: models

### ** Examples


mod1 <- C5.0(Species ~ ., data = iris)
plot(mod1)
plot(mod1, subtree = 3)


mod2 <- C5.0(Species ~ ., data = iris, trials = 10)
plot(mod2) ## should be the same as above

## plot first weighted tree
plot(mod2, trial = 1)




