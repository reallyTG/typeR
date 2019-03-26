library(pracma)


### Name: polyarea
### Title: Area of a Polygon
### Aliases: polyarea poly_center poly_length poly_crossings
### Keywords: math

### ** Examples

  # Zu Chongzhi's calculation of pi (China, about 480 A.D.),
  # approximating the circle from inside by a regular 12288-polygon(!):
  phi <- seq(0, 2*pi, len=3*2^12+1)
  x <- cos(phi)
  y <- sin(phi)
  pi_approx <- polyarea(x, y)
  print(pi_approx, digits=8)    #=> 3.1415925 or 355/113

  poly_length(x, y)              #=> 6.2831852 where 2*pi is 6.2831853

  x1 <- x + 0.5; y1 <- y + 0.5
  x2 <- rev(x1); y2 <- rev(y1)
  poly_center(x1, y1)            #=> 0.5 0.5
  poly_center(x2, y2)            #=> 0.5 0.5

  # A simple example
  L1 <- matrix(c(0, 0.5, 1, 1,   2,
                0, 1,   1, 0.5, 0), nrow = 2, byrow = TRUE)
  L2 <- matrix(c(0.5, 0.75, 1.25, 1.25,
                0,   0.75, 0.75, 0   ), nrow = 2, byrow = TRUE)
  P <- poly_crossings(L1, L2)
  P
  ##         x     y
  ## [1,] 1.00 0.750
  ## [2,] 1.25 0.375

## Not run: 
##D   # Crossings of Logarithmic and Archimedian spirals
##D   # Logarithmic spiral
##D   a <- 1; b <- 0.1
##D   t <- seq(0, 5*pi, length.out = 200)
##D   xl <- a*exp(b*t)*cos(t) - 1
##D   yl <- a*exp(b*t)*sin(t)
##D   plot(xl, yl, type = "l", lwd = 2, col = "blue",
##D        xlim = c(-6, 3), ylim = c(-3, 4), xlab = "", ylab = "",
##D        main = "Intersecting Logarithmic and Archimedian spirals")
##D   grid()
##D 
##D   # Archimedian spiral
##D   a <- 0; b <- 0.25
##D   r <- a + b*t
##D   xa <- r * cos(t)
##D   ya <- r*sin(t)
##D   lines(xa, ya, type = "l", lwd = 2, col = "red")
##D   legend(-6.2, -1.0, c("Logarithmic", "Archimedian"),
##D          lwd = 2, col = c("blue", "red"), bg = "whitesmoke")
##D 
##D   L1 <- rbind(xl, yl)
##D   L2 <- rbind(xa, ya)
##D   P <- poly_crossings(L1, L2)
##D   points(P)
##D   
## End(Not run)



