library(pixmap)


### Name: channels-methods
### Title: Methods for Channel Manipulation
### Aliases: addChannels getChannels addChannels-methods
###   getChannels-methods addChannels,pixmapRGB-method
###   getChannels,pixmapChannels-method
### Keywords: methods

### ** Examples

  x <- pixmapRGB(rep(1:5, 3), nrow=4)
  plot(x)
  print(x)

  getChannels(x)
  getChannels(x, colors=c("red", "green"))

  y = addChannels(x)
  plot(y)
  print(y)

  ## extract only the red channel
  y = addChannels(x, coef=c(1,0,0))
  plot(y)



