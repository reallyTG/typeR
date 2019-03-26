library(kmed)


### Name: fastkmed
### Title: Simple and fast k-medoid algorithm from Park and Jun.
### Aliases: fastkmed

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
result <- fastkmed(mrwdist, ncluster = 3, iterate = 50)
table(result$cluster, iris[,5])





