library(kmed)


### Name: distNumeric
### Title: A pair distance for continuous variables.
### Aliases: distNumeric

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
mrwdist[1:6,1:6]




