library(Compositional)


### Name: The alpha-distance
### Title: The alpha-distance
### Aliases: alfadist alfadista
### Keywords: \alpha -transformation Euclidean distance Manhattan distance

### ** Examples

library(MASS)
x <- as.matrix(fgl[1:20, 2:9])
x <- x / rowSums(x)
alfadist(x, 0.1)
alfadist(x, 1)



