library(rockchalk)


### Name: perspEmpty
### Title: perspEmpty
### Aliases: perspEmpty

### ** Examples

x1 <- 1:10
x2 <- 41:50
y <-  rnorm(10)
perspEmpty(x1, x2, y)
res <- perspEmpty(x1, x2, y, ticktype="detailed", nticks=10)
mypoints1 <- trans3d ( x1, x2, y, pmat = res )
points( mypoints1, pch = 16, col= "blue")



