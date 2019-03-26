library(mclust)


### Name: classError
### Title: Classification error
### Aliases: classError
### Keywords: cluster

### ** Examples

a <- rep(1:3, 3)
a
b <- rep(c("A", "B", "C"), 3)
b
classError(a, b)

a <- sample(1:3, 9, replace = TRUE)
a
b <- sample(c("A", "B", "C"), 9, replace = TRUE)
b
classError(a, b)



