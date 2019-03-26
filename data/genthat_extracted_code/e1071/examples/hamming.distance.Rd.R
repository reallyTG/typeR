library(e1071)


### Name: hamming.distance
### Title: Hamming Distances of Vectors
### Aliases: hamming.distance
### Keywords: multivariate

### ** Examples

x <- c(1, 0, 0)
y <- c(1, 0, 1)
hamming.distance(x, y)
z <- rbind(x,y)
rownames(z) <- c("Fred", "Tom")
hamming.distance(z)

hamming.distance(1:3, 3:1)



