library(kmed)


### Name: silhoutte
### Title: Silhoutte index of each cluster.
### Aliases: silhoutte

### ** Examples

distiris <- as.matrix(dist(iris[,1:4]))
res <- fastkmed(distiris, 3)
silh <- silhoutte(distiris, res$medoid, res$cluster)
silh$result[c(1:3,70:75,101:103),]
silh$plot




