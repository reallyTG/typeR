library(scatterplot3d)


### Name: scatterplot3d
### Title: 3D Scatter Plot
### Aliases: scatterplot3d
### Keywords: hplot

### ** Examples

  ## On some devices not all colors can be displayed.
  ## Try the postscript device or use highlight.3d = FALSE.

  ## example 1
  z <- seq(-10, 10, 0.01)
  x <- cos(z)
  y <- sin(z)
  scatterplot3d(x, y, z, highlight.3d=TRUE, col.axis="blue",
      col.grid="lightblue", main="scatterplot3d - 1", pch=20)

  ## example 2
  temp <- seq(-pi, 0, length = 50)
  x <- c(rep(1, 50) %*% t(cos(temp)))
  y <- c(cos(temp) %*% t(sin(temp)))
  z <- c(sin(temp) %*% t(sin(temp)))
  scatterplot3d(x, y, z, highlight.3d=TRUE,
      col.axis="blue", col.grid="lightblue",
      main="scatterplot3d - 2", pch=20)

  ## example 3
  temp <- seq(-pi, 0, length = 50)
  x <- c(rep(1, 50) %*% t(cos(temp)))
  y <- c(cos(temp) %*% t(sin(temp)))
  z <- 10 * c(sin(temp) %*% t(sin(temp)))
  color <- rep("green", length(x))
  temp <- seq(-10, 10, 0.01)
  x <- c(x, cos(temp))
  y <- c(y, sin(temp))
  z <- c(z, temp)
  color <- c(color, rep("red", length(temp)))
  scatterplot3d(x, y, z, color, pch=20, zlim=c(-2, 10),
      main="scatterplot3d - 3")

  ## example 4
  my.mat <- matrix(runif(25), nrow=5)
  dimnames(my.mat) <- list(LETTERS[1:5], letters[11:15])
  my.mat # the matrix we want to plot ...

  s3d.dat <- data.frame(cols=as.vector(col(my.mat)),
      rows=as.vector(row(my.mat)),
      value=as.vector(my.mat))
  scatterplot3d(s3d.dat, type="h", lwd=5, pch=" ",
      x.ticklabs=colnames(my.mat), y.ticklabs=rownames(my.mat),
      color=grey(25:1/40), main="scatterplot3d - 4")

  ## example 5
  data(trees)
  s3d <- scatterplot3d(trees, type="h", highlight.3d=TRUE,
      angle=55, scale.y=0.7, pch=16, main="scatterplot3d - 5")
  # Now adding some points to the "scatterplot3d"
  s3d$points3d(seq(10,20,2), seq(85,60,-5), seq(60,10,-10),
      col="blue", type="h", pch=16)
  # Now adding a regression plane to the "scatterplot3d"
  attach(trees)
  my.lm <- lm(Volume ~ Girth + Height)
  s3d$plane3d(my.lm, lty.box = "solid")
  
  ## example 6; by Martin Maechler
  cubedraw <- function(res3d, min = 0, max = 255, cex = 2, text. = FALSE)
  {
    ## Purpose: Draw nice cube with corners
    cube01 <- rbind(c(0,0,1), 0, c(1,0,0), c(1,1,0), 1, c(0,1,1), # < 6 outer
                    c(1,0,1), c(0,1,0)) # <- "inner": fore- & back-ground
    cub <- min + (max-min)* cube01
    ## visibile corners + lines:
    res3d$points3d(cub[c(1:6,1,7,3,7,5) ,], cex = cex, type = 'b', lty = 1)
    ## hidden corner + lines
    res3d$points3d(cub[c(2,8,4,8,6),     ], cex = cex, type = 'b', lty = 3)
    if(text.)## debug
        text(res3d$xyz.convert(cub), labels=1:nrow(cub), col='tomato', cex=2)
  }
  ## 6 a) The named colors in R, i.e. colors()
  cc <- colors()
  crgb <- t(col2rgb(cc))
  par(xpd = TRUE)
  rr <- scatterplot3d(crgb, color = cc, box = FALSE, angle = 24,
      xlim = c(-50, 300), ylim = c(-50, 300), zlim = c(-50, 300))
  cubedraw(rr)
  ## 6 b) The rainbow colors from rainbow(201)
  rbc <- rainbow(201)
  Rrb <- t(col2rgb(rbc))
  rR <- scatterplot3d(Rrb, color = rbc, box = FALSE, angle = 24,
      xlim = c(-50, 300), ylim = c(-50, 300), zlim = c(-50, 300))
  cubedraw(rR)
  rR$points3d(Rrb, col = rbc, pch = 16)



