library(kmed)


### Name: consensusmatrix
### Title: Consensus matrix from A bootstrap replicate matrix
### Aliases: consensusmatrix

### ** Examples

num <- as.matrix(iris[,1:4])
mrwdist <- distNumeric(num, num, method = "mrw")
parkboot <- function(x, nclust) {
res <- fastkmed(x, nclust, iterate = 50)
return(res$cluster)
}
irisboot <- clustboot(mrwdist, nclust=3, parkboot, nboot=7)
wardorder <- function(x, nclust) {
res <- hclust(x, method = "ward.D2")
member <- cutree(res, nclust)
return(member)
}
consensusiris <- consensusmatrix(irisboot, nclust = 3, wardorder)
consensusiris[c(1:5,51:55,101:105),c(1:5,51:55,101:105)]




