library(misc3d)


### Name: drawScene
### Title: Rendering of Triangular Mesh Surface Data
### Aliases: drawScene drawScene.rgl
### Keywords: hplot

### ** Examples

  vtri <- local({
      z <- 2 * volcano
      x <- 10 * (1:nrow(z))
      y <- 10 * (1:ncol(z))
      surfaceTriangles(x, y, z, color="green3")
  })
  drawScene(vtri, scale = FALSE)
  drawScene(vtri, screen=list(x=40, y=-40, z=-135), scale = FALSE)
  drawScene(vtri, screen=list(x=40, y=-40, z=-135), scale = FALSE,
            perspective = TRUE)
  drawScene(vtri, screen=list(x=40, y=-40, z=-135), scale = FALSE,
            perspective = TRUE, depth = 0.4)



