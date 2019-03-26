library(kmed)


### Name: stepkmed
### Title: Step k-medoid algorithm from Yu et al.
### Aliases: stepkmed

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
result <- stepkmed(mrwdist, ncluster = 3, iterate = 50, alpha = 1.5)
table(result$cluster, iris[,5])





