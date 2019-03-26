library(rgl)


### Name: ageControl
### Title: Set attributes of vertices based on their age.
### Aliases: ageControl

### ** Examples

  saveopts <- options(rgl.useNULL = TRUE)

  theta <- seq(0, 4*pi, len=100)
  xyz <- cbind(sin(theta), cos(theta), sin(theta/2))
  lineid <- plot3d(xyz, type="l", alpha = 0, lwd = 5, col = "blue")["data"]

  widget <- rglwidget() %>%
  playwidget(ageControl(births = theta,
                        ages = c(-4*pi, -4*pi, 1-4*pi, 0, 0, 1),
                        objids = lineid,
                        alpha = c(0, 1, 0, 0, 1, 0)),
             start = 0, stop = 4*pi,
             step = 0.1, rate = 4)
  if (interactive())
    widget
  options(saveopts)



