library(kmed)


### Name: clustboot
### Title: Bootstrap replications for clustering alorithm
### Aliases: clustboot

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
parkboot <- function(x, nclust) {
res <- fastkmed(x, nclust, iterate = 50)
return(res$cluster)
}
irisboot <- clustboot(mrwdist, nclust=3, parkboot, nboot=7)
head(irisboot)





