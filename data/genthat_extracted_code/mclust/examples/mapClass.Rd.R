library(mclust)


### Name: mapClass
### Title: Correspondence between classifications.
### Aliases: mapClass
### Keywords: cluster

### ** Examples

a <- rep(1:3, 3)
a
b <- rep(c("A", "B", "C"), 3)
b
mapClass(a, b)
a <- sample(1:3, 9, replace = TRUE)
a
b <- sample(c("A", "B", "C"), 9, replace = TRUE)
b
mapClass(a, b)



