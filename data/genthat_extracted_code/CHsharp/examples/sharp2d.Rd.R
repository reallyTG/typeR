library(CHsharp)


### Name: sharp2d
### Title: Identify Cluster Centres for 2-dimensional Data via Data
###   Sharpening
### Aliases: sharp2d
### Keywords: cluster

### ** Examples

x <- 1:200
y <- c(rnorm(50,-1,1),rnorm(50,2,2), rnorm(100,0,.5))
data.sharp5 <- sharp2d(x,y,5,10,5)
data.sharp10 <- sharp2d(x,y,5,10,10)
# original data:
plot(x,y)
# sharpened data after 5 iterations:
points(data.sharp5$x.sharp, data.sharp5$y.sharp, col=2,pch=19)
# sharpened data after 10 iterations:
points(data.sharp10$x.sharp, data.sharp10$y.sharp, col=4, pch=19)



