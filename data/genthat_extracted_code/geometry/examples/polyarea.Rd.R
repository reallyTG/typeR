library(geometry)


### Name: polyarea
### Title: Determines area of a polygon by triangle method.
### Aliases: polyarea

### ** Examples

x <- c(1, 1, 3, 3, 1)
y <- c(1, 3, 3, 1, 1)
polyarea(x, y)
polyarea(cbind(x, x), cbind(y, y)) ##  c(4, 4)
polyarea(cbind(x, x), cbind(y,y), 1) ##  c(4, 4)
polyarea(rbind(x, x), rbind(y,y), 2) ##  c(4, 4)



