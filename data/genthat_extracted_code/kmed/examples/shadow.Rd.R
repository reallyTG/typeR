library(kmed)


### Name: shadow
### Title: Centroid shadow value (CSV) index of each cluster based on
###   medoid.
### Aliases: shadow

### ** Examples

distiris <- as.matrix(dist(iris[,1:4]))
res <- fastkmed(distiris, 3)
sha <- shadow(distiris, res$medoid, res$cluster)
sha$result[c(1:3,70:75,101:103),]
sha$plot




