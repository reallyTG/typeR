library(pracma)


### Name: inpolygon
### Title: Polygon Region
### Aliases: inpolygon
### Keywords: geom

### ** Examples

xp <- c(0.5, 0.75, 0.75, 0.5, 0.5)
yp <- c(0.5, 0.5, 0.75, 0.75, 0.5)
x <- c(0.6, 0.75, 0.6, 0.5)
y <- c(0.5, 0.6, 0.75, 0.6)
inpolygon(x, y, xp, yp, boundary = FALSE)  # FALSE
inpolygon(x, y, xp, yp, boundary = TRUE)   # TRUE

## Not run: 
##D pg <- matrix(c(0.15, 0.75, 0.25, 0.45, 0.70,
##D                0.80, 0.35, 0.55, 0.20, 0.90), 5, 2)
##D plot(c(0, 1), c(0, 1), type="n")
##D polygon(pg[,1], pg[,2])
##D P <- matrix(runif(20000), 10000, 2)
##D R <- inpolygon(P[, 1], P[, 2], pg[, 1], pg[,2])
##D clrs <- ifelse(R, "red", "blue")
##D points(P[, 1], P[, 2], pch = ".", col = clrs)
## End(Not run)



