library(spatial)


### Name: predict.trls
### Title: Predict method for trend surface fits
### Aliases: predict.trls
### Keywords: spatial

### ** Examples

data(topo, package="MASS")
topo2 <- surf.ls(2, topo)
topo4 <- surf.ls(4, topo)
x <- c(1.78, 2.21)
y <- c(6.15, 6.15)
z2 <- predict(topo2, x, y)
z4 <- predict(topo4, x, y)
cat("2nd order predictions:", z2, "\n4th order predictions:", z4, "\n")



