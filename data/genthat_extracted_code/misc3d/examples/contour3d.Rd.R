library(misc3d)


### Name: contour3d
### Title: Draw an Isosurface, a Three Dimension Contour Plot
### Aliases: contour3d
### Keywords: hplot

### ** Examples

  #Example 1: Draw a ball
  f <- function(x, y, z)x^2+y^2+z^2
  x <- seq(-2,2,len=20)
  contour3d(f,4,x,x,x)
  contour3d(f,4,x,x,x, engine = "standard")

  # ball with one corner removed.
  contour3d(f,4,x,x,x, mask = function(x,y,z) x > 0 | y > 0 | z > 0)
  contour3d(f,4,x,x,x, mask = function(x,y,z) x > 0 | y > 0 | z > 0,
            engine="standard", screen = list(x = 290, y = -20),
            color = "red", color2 = "white")

  # ball with computed colors
  w <- function(x,y,z) {
      v <- sin(x) + cos(2 * y) * sin(5 * z)
      r <- range(v)
      n <- 100
      i <- pmax(pmin(ceiling(n * (v - r[1]) / (r[2] - r[1])), n), 1)
      terrain.colors(n)[i]
  }
  contour3d(f,4,x,x,x, color = w)

  #Example 2: Nested contours of mixture of three tri-variate normal densities
  nmix3 <- function(x, y, z, m, s) {
      0.4 * dnorm(x, m, s) * dnorm(y, m, s) * dnorm(z, m, s) +
      0.3 * dnorm(x, -m, s) * dnorm(y, -m, s) * dnorm(z, -m, s) +
      0.3 * dnorm(x, m, s) * dnorm(y, -1.5 * m, s) * dnorm(z, m, s)
  }
  f <- function(x,y,z) nmix3(x,y,z,.5,.5)
  g <- function(n = 40, k = 5, alo = 0.1, ahi = 0.5, cmap = heat.colors) {
      th <- seq(0.05, 0.2, len = k)
      col <- rev(cmap(length(th)))
      al <- seq(alo, ahi, len = length(th))
      x <- seq(-2, 2, len=n)
      contour3d(f,th,x,x,x,color=col,alpha=al)
      bg3d(col="white")
  }
  g(40,5)
  gs <- function(n = 40, k = 5, cmap = heat.colors, ...) {
      th <- seq(0.05, 0.2, len = k)
      col <- rev(cmap(length(th)))
      x <- seq(-2, 2, len=n)
      m <- function(x,y,z) x > .25 | y < -.3
      contour3d(f,th,x,x,x,color=col, mask = m, engine = "standard",
                scale = FALSE, ...)
      bg3d(col="white")
  }
  gs(40, 5, screen=list(z = 130, x = -80), color2 = "lightgray", cmap=rainbow)

## Not run: 
##D   #Example 3: Nested contours for FMRI data.
##D   library(AnalyzeFMRI)
##D   a <- f.read.analyze.volume(system.file("example.img", package="AnalyzeFMRI"))
##D   a <- a[,,,1]
##D   contour3d(a, 1:64, 1:64, 1.5*(1:21), lev=c(3000, 8000, 10000),
##D             alpha = c(0.2, 0.5, 1), color = c("white", "red", "green"))
##D 
##D   # alternative masking out a corner
##D   m <- array(TRUE, dim(a))
##D   m[1:30,1:30,1:10] <- FALSE
##D   contour3d(a, 1:64, 1:64, 1.5*(1:21), lev=c(3000, 8000, 10000),
##D             mask = m, color = c("white", "red", "green"))
##D   contour3d(a, 1:64, 1:64, 1.5*(1:21), lev=c(3000, 8000, 10000),
##D             color = c("white", "red", "green"),
##D             color2 = c("gray", "red", "green"),
##D             mask = m, engine="standard",
##D             scale = FALSE, screen=list(z = 60, x = -120))
##D   
## End(Not run)

  #Example 4: Separate the triangles from the contours of
  #           mixture of three tri-variate normal densities
  nmix3 <- function(x, y, z, m, s) {
      0.3*dnorm(x, -m, s) * dnorm(y, -m, s) * dnorm(z, -m, s) +
      0.3*dnorm(x, -2*m, s) * dnorm(y, -2*m, s) * dnorm(z, -2*m, s) +
      0.4*dnorm(x, -3*m, s) * dnorm(y, -3 * m, s) * dnorm(z, -3*m, s) }
  f <- function(x,y,z) nmix3(x,y,z,0.5,.1)
  n <- 20
  x <- y <- z <- seq(-2, 2, len=n)
  contour3dObj <- contour3d(f, 0.35, x, y, z, draw=FALSE, separate=TRUE)
  for(i in 1:length(contour3dObj))
      contour3dObj[[i]]$color <- rainbow(length(contour3dObj))[i]
  drawScene.rgl(contour3dObj)



