library(rgl)


### Name: vertexControl
### Title: Set attributes of vertices.
### Aliases: vertexControl

### ** Examples

  saveopts <- options(rgl.useNULL = TRUE)

  theta <- seq(0, 6*pi, len=100)
  xyz <- cbind(sin(theta), cos(theta), theta)
  plot3d(xyz, type="l")
  id <- spheres3d(xyz[1,,drop=FALSE], col="red")

  widget <- rglwidget(width=500, height=300) %>%
  playwidget(vertexControl(values=xyz,
                           attributes=c("x", "y", "z"),
                           objid = id, param=1:100),
             start = 1, stop = 100, rate=10)
  if (interactive())
    widget
  options(saveopts)



