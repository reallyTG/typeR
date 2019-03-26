library(kmed)


### Name: rankkmed
### Title: Rank k-medoid algorithm from Zadegan et. al.
### Aliases: rankkmed

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
result <- fastkmed(mrwdist, ncluster = 3, iterate = 50)
table(result$cluster, iris[,5])





