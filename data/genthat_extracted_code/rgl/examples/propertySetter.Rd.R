library(rgl)


### Name: propertySetter
### Title: Write HTML/Javascript code to control a WebGL display.
### Aliases: propertySlider propertySetter par3dinterpSetter matrixSetter
###   vertexSetter

### ** Examples

  # Just the setter function
  cat(propertySetter(1:4, entries = 12, properties = "values", objids = 13))

  # A 4-position slider
  propertySlider(values = 1:4, entries = 12, properties = "values", objids = 13, interp = FALSE)

  # A 10-position slider interpolating the 4-position slider
  propertySlider(values = 1:4, entries = 12, properties = "values", objids = 13,
               step = (4-1)/9)
               
  # The userMatrix interpolation from example(play3d)
  M <- r3dDefaults$userMatrix
  fn <- par3dinterp(time = (0:2)*0.75, userMatrix = list(M,
                                     rotate3d(M, pi/2, 1, 0, 0),
                                     rotate3d(M, pi/2, 0, 1, 0) ) )
  cat(par3dinterpSetter(fn, 0, 3, steps=10))



