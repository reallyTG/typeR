library(robCompositions)


### Name: ageCatWorld
### Title: child, middle and eldery population
### Aliases: ageCatWorld
### Keywords: data

### ** Examples


data(ageCatWorld)
str(ageCatWorld)
summary(ageCatWorld)
rowSums(ageCatWorld[, 1:3])
ternaryDiag(ageCatWorld[, 1:3])
plot(pivotCoord(ageCatWorld[, 1:3]))



