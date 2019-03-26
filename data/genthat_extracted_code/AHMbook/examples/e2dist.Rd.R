library(AHMbook)


### Name: e2dist
### Title: Calculates the pair-wise distances between two sets of points
### Aliases: e2dist

### ** Examples


pts1 <- expand.grid(x = 1:5, y = 6:8)
pts2 <- cbind(x=runif(5, 1, 5), y=runif(5, 6, 8))
require(graphics)
plot(pts1)
points(pts2, pch=19, col='red')
e2dist(x=pts1, y=pts2)
# x and y can be the same:
e2dist(x=pts2, y=pts2)




