library(sclero)


### Name: create.rawDist
### Title: Create rawDist data from arbitary coordinates
### Aliases: create.rawDist

### ** Examples

dev.off()
W <- square(10)
S <- ppp(x = c(7, 5, 3), y = rep(5,3), window = W)
G <- psp(x0 = c(8,6,4,2), y0 = rep(2,4), x1 = c(8,6,4,2), y1 = rep(8,4), window = W)
M <- psp(x0 = 0, x1 = 8, y0 = 5, y1 = 5, window = W)
x <- create.rawDist(spots = S, gbs = G, main = M)
plot(x)

## Generate random points for alignment
set.seed(1)
S <- rpoint(n = 5, win = owin(xrange = c(2,7), yrange = c(5,7)))
S$window <- W
G <- psp(x0 = c(7,5,3,1), y0 = rep(2,4), x1 = c(9,7,5,3), y1 = rep(8,4), window = W)
M <- psp(x0 = 0, x1 = 8, y0 = 1, y1 = 1, window = W)
x <- create.rawDist(spots = S, gbs = G, main = M)
plot(x)
y <- spot.dist(x)
plot(y)



