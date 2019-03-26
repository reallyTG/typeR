library(pracma)


### Name: segm_intersect
### Title: Segment Intersection
### Aliases: segm_intersect
### Keywords: geom

### ** Examples

## Not run: 
##D plot(c(0, 1), c(0, 1), type="n",
##D      xlab = "", ylab = "", main = "Segment Intersection")
##D grid()
##D for (i in 1:20) {
##D s1 <- matrix(runif(4), 2, 2)
##D s2 <- matrix(runif(4), 2, 2)
##D if (segm_intersect(s1, s2)) {
##D     clr <- "red"
##D     p1 <- s1[1, ]; p2 <- s1[2, ]; p3 <- s2[1, ]; p4 <- s2[2, ]
##D     A <- cbind(p2 - p1, p4 - p3)
##D     b <- (p3 - p1)
##D     a <- solve(A, b)
##D     points((p1 + a[1]*(p2-p1))[1], (p1 + a[1]*(p2-p1))[2], pch = 19, col = "blue")
##D } else
##D     clr <- "darkred"
##D lines(s1[,1], s1[, 2], col = clr)
##D lines(s2[,1], s2[, 2], col = clr)
##D }
## End(Not run)



