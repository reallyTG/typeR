library(squash)


### Name: cimage
### Title: Draw a matrix of colored rectangles
### Aliases: cimage
### Keywords: hplot

### ** Examples


  ## Visualize nearly all built-in R colors
  color.mat <- matrix(colors()[1:625], nrow = 25)
  cimage(zcol = color.mat)

  ## An example using "zsize"
  x <- y <- 1:10
  zcolor <- matrix( rainbow(100)[outer(x, y)], nrow = 10 )
  zsize <- matrix( runif(100), nrow = 10 )
  cimage(x, y, zcol = zcolor, zsize = zsize)

  ## Another simple example
  red <- green <- 0:255
  rg <- outer(red, green, rgb, blue = 1, maxColorValue = 255)
  cimage(red, green, zcol = rg)
  
  ## The same, but using useRaster (resulting in faster image generation, 
  ## and smaller file size if saved as a PDF)
  cimage(red, green, zcol = rg, useRaster = TRUE)

  ## An example with categorical axes
  colormixer <- function(x, y) {
      r <- (col2rgb(x) + col2rgb(y)) / 2
      rgb(as.data.frame(t(r)), maxColorValue = 255)
  }
  set.seed(123)
  x <- sample(colors(), 15)
  y <- sample(colors(), 10)
  mix <- outer(x, y, colormixer)
  op <- par(mar = c(8, 8, 2, 2), las = 2)
  cimage(zcol = mix, xlabels = x, ylabels = y, xlab = NA, ylab = NA)
  par(op)
  
  ## An example with non-uniform midpoints and breakpoints
  rg2 <- rg[seq(1, 255, by = 62), seq(1, 255, by = 62)]
  cimage(x = (1:5)^2, y = c(3, 5, 6, 9, 10, 11), zcol = rg2, 
         zsize = matrix(runif(25, min = 0.5), nrow = 5))
    



