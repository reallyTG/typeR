library(CHsharp)


### Name: sharp3d
### Title: Identify Cluster Centres for 3-dimensional Data via Data
###   Sharpening
### Aliases: sharp3d
### Keywords: cluster

### ** Examples

x <- 1:200
y <- c(rnorm(50,-1,1),rnorm(50,2,2), rnorm(100,0,.5))
z <- c(sample(1:50,50), sample(26:75,50), sample(51:150,100))
data.sharp5 <- sharp3d(x,y,z,5,10,5)
data.sharp10 <- sharp3d(x,y,z,5,10,10)
# original data:
dataPlot <- scatterplot3d(x,y,z)
# sharpened data after 5 iterations:
dataPlot$points3d(data.sharp5$x.sharp, data.sharp5$y.sharp, 
data.sharp5$z.sharp, col=2,pch=19)
# sharpened data after 10 iterations:
dataPlot$points3d(data.sharp10$x.sharp, data.sharp10$y.sharp, 
data.sharp10$z.sharp, col=4, pch=19)



