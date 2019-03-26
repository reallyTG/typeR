library(spBayes)


### Name: pointsInPoly
### Title: Finds points in a polygon
### Aliases: pointsInPoly
### Keywords: misc

### ** Examples


## Not run: 
##D ##Example 1
##D points <- cbind(runif(1000, 0, 10),runif(1000, 0, 10))
##D 
##D poly <- cbind(c(1:9,8:1), c(1,2*(5:3),2,-1,17,9,8,2:9))
##D 
##D point.indx <- pointsInPoly(poly, points)
##D 
##D plot(points, pch=19, cex=0.5, xlab="x", ylab="y", col="red")
##D points(points[point.indx,], pch=19, cex=0.5, col="blue")
##D polygon(poly)
##D 
##D ##Example 2
##D ##a function to partition the domain
##D tiles <- function(points, x.cnt, y.cnt, tol = 1.0e-10){
##D 
##D   x.min <- min(points[,1])-tol
##D   x.max <- max(points[,1])+tol
##D   y.min <- min(points[,2])-tol
##D   y.max <- max(points[,2])+tol
##D   
##D   x.cnt <- x.cnt+1
##D   y.cnt <- y.cnt+1
##D   
##D   x <- seq(x.min, x.max, length.out=x.cnt)
##D   y <- seq(y.min, y.max, length.out=y.cnt)
##D 
##D   tile.list <- vector("list", (length(y)-1)*(length(x)-1))
##D 
##D   l <- 1
##D   for(i in 1:(length(y)-1)){
##D     for(j in 1:(length(x)-1)){
##D       tile.list[[l]] <- rbind(c(x[j], y[i]),
##D                               c(x[j+1], y[i]),
##D                               c(x[j+1], y[i+1]),
##D                               c(x[j], y[i+1]))
##D        l <- l+1
##D     }
##D 
##D   }
##D 
##D   tile.list
##D }
##D 
##D n <- 1000
##D points <- cbind(runif(n, 0, 10), runif(n, 0, 10))
##D 
##D grd <- tiles(points, x.cnt=10, y.cnt=10)
##D 
##D plot(points, pch=19, cex=0.5, xlab="x", ylab="y")
##D 
##D sum.points <- 0
##D for(i in 1:length(grd)){
##D   polygon(grd[[i]], border="red")
##D   
##D   point.indx <- pointsInPoly(grd[[i]], points)
##D   
##D   if(!is.na(point.indx[1])){
##D     sum.points <- length(point.indx)+sum.points
##D     
##D     text(mean(grd[[i]][,1]), mean(grd[[i]][,2]), length(point.indx), col="red")
##D   }
##D }
##D sum.points
##D 
## End(Not run)




