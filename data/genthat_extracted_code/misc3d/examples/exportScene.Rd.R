library(misc3d)


### Name: exportScene
### Title: Writing Out Triangular Mesh Scenes
### Aliases: exportScene
### Keywords: hplot

### ** Examples

  nmix3 <- function(x, y, z, m, s) {
      0.4 * dnorm(x, m, s) * dnorm(y, m, s) * dnorm(z, m, s) +
      0.3 * dnorm(x, -m, s) * dnorm(y, -m, s) * dnorm(z, -m, s) +
      0.3 * dnorm(x, m, s) * dnorm(y, -1.5 * m, s) * dnorm(z, m, s)
  }
 
  f <- function(x,y,z) nmix3(x,y,z,.5,.5)
 
  gs1 <- function(n = 40, k = 5, cmap = heat.colors, ...) {
      th <- seq(0.05, 0.2, len = k)
      col <- rev(cmap(length(th)))
      x <- seq(-2, 2, len=n)
      m <- function(x,y,z) x > .25 | y < -.3
      contour3d(f,th,x,x,x,color=col, mask = m, engine = "none",
               scale = FALSE, ...)
  }
 
  conts <- gs1(40, 5, screen=list(z = 130, x = -80),
               color2 = "lightgray", cmap=rainbow)
  exportScene(conts, "nmix", "OFF")



