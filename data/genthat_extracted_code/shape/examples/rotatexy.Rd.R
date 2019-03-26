library(shape)


### Name: rotatexy
### Title: rotates 2-column matrix around a midpoint
### Aliases: rotatexy
### Keywords: manip

### ** Examples

x <- seq(0, 2*pi, pi/100)
y <- sin(x)
cols <- intpalette(c("blue", "green", "yellow", "red"), n = 500)
cols <- c(cols,rev(cols))
plot(x, y, type = "l", ylim = c(-3, 3), main = "rotatexy", 
     col = cols[1], lwd = 2)
for (i in 2:1000) 
  lines(rotatexy( cbind(x, y), angle = 0.18*i),
        col = cols[i], lwd = 2)
  
cols <- femmecol(1000)
plot(x, y, xlim = c(-1, 1), ylim = c(-1, 1), main = "rotatexy",
     col = cols[1], type = "n")
for (i in 2:1000) {
  xy <- rotatexy(c(0, 1), angle = 0.36*i, mid = c(0,0))
  points(xy[1], xy[2], col = cols[i], pch = ".", cex = 2)
}



