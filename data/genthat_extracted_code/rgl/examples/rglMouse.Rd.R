library(rgl)


### Name: rglMouse
### Title: Generate HTML code to select mouse mode.
### Aliases: rglMouse

### ** Examples

if (interactive()) {
  open3d()
  xyz <- matrix(rnorm(300), ncol = 3)
  id <- plot3d(xyz, col = "red", type = "s")["data"]
  par3d(mouseMode = "selecting")
  share <- rglShared(id)

# This puts the selector below the widget.
  rglwidget(shared = share, width = 300, height = 300) %>% rglMouse()
  
# This puts the selector above the widget.
  rglMouse() %>% rglwidget(shared = share, width = 300, height = 300, controllers = .) 
}



