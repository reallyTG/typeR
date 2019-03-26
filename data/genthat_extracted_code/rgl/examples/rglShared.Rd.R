library(rgl)


### Name: rglShared
### Title: Create shared data from an rgl object.
### Aliases: rglShared

### ** Examples

  save <- options(rgl.useNULL = TRUE)
  open3d()
  x <- sort(rnorm(100))
  y <- rnorm(100)
  z <- rnorm(100) + atan2(x, y)
  ids <- plot3d(x, y, z, col = rainbow(100))
  # The data will be selected and filtered, the the axes.
  sharedData <- rglShared(ids["data"])
  
  # Also add some labels that are only displayed
  # when points are selected
  
  sharedLabel <- rglShared(text3d(x, y, z, text = 1:100,
                                  adj = -0.5),
                           group = sharedData$groupName(),
                           deselectedFade = 0,
                           selectedIgnoreNone = FALSE) 
  if (interactive()) 
    crosstalk::filter_slider("x", "x", sharedData, ~x) %>%
    rglwidget(shared = list(sharedData, sharedLabel), controller = .) %>% 
    rglMouse()
      
  options(save)
  


