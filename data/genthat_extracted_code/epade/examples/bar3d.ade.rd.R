library(epade)


### Name: bar3d.ade
### Title: 3D Bar-Plot
### Aliases: bar3d.ade
### Keywords: barplot

### ** Examples

bar3d.ade(rpois(200,2), rpois(200,2), wall=3)
x <- seq(-16, 16, length= 48)
y <- x
f <- function(x,y) { r <- sqrt(x^2+y^2); 10 * sin(r)/r }
z <- outer(x, y, f)
z[is.na(z)] <- 1
bar3d.ade(z, wall=2, xw=1, zw=0.2, axes=FALSE, bgbox=FALSE,
xlab='', ylab='', zlab='', alpha=1, col='lavender')



