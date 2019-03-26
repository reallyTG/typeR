library(rgl)


### Name: par3dinterpControl
### Title: Control rgl widget like par3dinterp().
### Aliases: par3dinterpControl

### ** Examples

example(plot3d)
M <- r3dDefaults$userMatrix
fn <- par3dinterp(times = (0:2)*0.75, userMatrix = list(M,
                                      rotate3d(M, pi/2, 1, 0, 0),
                                      rotate3d(M, pi/2, 0, 1, 0)),
                                      scale = c(0.5, 1, 2))
control <- par3dinterpControl(fn, 0, 3, steps = 15)
control      
if (interactive()) 
  rglwidget(width = 500, height = 250) %>%
  playwidget(control,
       step = 0.01, loop = TRUE, rate = 0.5)



