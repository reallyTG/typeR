library(rgl)


### Name: writeWebGL
### Title: Write scene to HTML.
### Aliases: writeWebGL
### Keywords: graphics

### ** Examples

  plot3d(rnorm(100), rnorm(100), rnorm(100), type = "s", col = "red")
  # This writes a copy into temporary directory 'webGL', and then displays it
  filename <- writeWebGL(dir = file.path(tempdir(), "webGL"), 
                       width = 500, reuse = TRUE)
  # Display the "reuse" attribute
  attr(filename, "reuse")

  # Display the scene in a browser
  if (interactive())
    browseURL(paste0("file://", filename))



