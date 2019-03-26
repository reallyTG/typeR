library(kmed)


### Name: clustheatmap
### Title: Consensus matrix heatmap from A consensus matrix
### Aliases: clustheatmap

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
clustheatmap(consensusiris)




