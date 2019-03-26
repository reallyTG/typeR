library(pracma)


### Name: segm_distance
### Title: Segment Distance
### Aliases: segm_distance
### Keywords: geom

### ** Examples

## Not run: 
##D plot(c(0, 1), c(0, 1), type = "n", asp=1, 
##D      xlab = "", ylab = "", main = "Segment Distances")
##D grid()
##D for (i in 1:20) {
##D     s1 <- matrix(runif(4), 2, 2)
##D     s2 <- matrix(runif(4), 2, 2)
##D     lines(s1[, 1], s1[, 2], col = "red")
##D     lines(s2[, 1], s2[, 2], col = "darkred")
##D     S <- segm_distance(s1[1,], s1[2,], s2[1,], s2[2,])
##D     S$d
##D     points(c(S$p[1], S$q[1]), c(S$p[2], S$q[2]), pch=20, col="navy")
##D     lines(c(S$p[1], S$q[1]), c(S$p[2], S$q[2]), col="gray")
##D }
## End(Not run)



