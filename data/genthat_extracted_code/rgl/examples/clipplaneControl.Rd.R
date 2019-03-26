library(rgl)


### Name: clipplaneControl
### Title: Sets attributes of a clipping plane.
### Aliases: clipplaneControl

### ** Examples

  open3d()
  saveopts <- options(rgl.useNULL = TRUE)
  xyz <- matrix(rnorm(300), ncol = 3)
  id <- plot3d(xyz, type="s", col = "blue", zlim = c(-3,3))["clipplanes"]
  dvals <- c(3, -3)
  widget <- rglwidget() %>%
    playwidget(clipplaneControl(d = dvals, clipplaneids = id),
               start = 0, stop = 1, step = 0.01,
               rate = 0.5)
  if (interactive())
    widget
  options(saveopts)



