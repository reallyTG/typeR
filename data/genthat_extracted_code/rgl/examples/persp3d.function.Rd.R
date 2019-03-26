library(rgl)


### Name: persp3d.function
### Title: Plot a function of two variables
### Aliases: plot3d.function persp3d.function
### Keywords: graphics

### ** Examples

# (1) The Obligatory Mathematical surface.
#     Rotated sinc function, with colors

f <- function(x, y) { 
  r <- sqrt(x^2 + y^2)
  ifelse(r == 0, 10, 10 * sin(r)/r)
}
open3d()
plot3d(f, col = colorRampPalette(c("blue", "white", "red")), 
       xlab = "X", ylab = "Y", zlab = "Sinc( r )", 
       xlim = c(-10, 10), ylim = c(-10, 10),
       aspect = c(1, 1, 0.5))
       
# (2) A cylindrical plot

f <- function(s, t) {
  r <- 1 + exp( -pmin( (s - t)^2, 
                       (s - t - 1)^2, 
                       (s - t + 1)^2 )/0.01 )
  cbind(r*cos(t*2*pi), r*sin(t*2*pi), s)
}

open3d()
plot3d(f, slim = c(0, 1), tlim = c(0, 1), col = "red", alpha = 0.8)

# Add a curve to the plot, fixing s at 0.5.

plot3d(f(0.5, seq.int(0, 1, length.out = 100)), type = "l", add = TRUE, 
       lwd = 3, depth_test = "lequal")



