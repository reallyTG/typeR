library(geneplotter)


### Name: savepng
### Title: Save the contents of the current graphics device to a file
### Aliases: savepdf saveeps savepng savetiff
### Keywords: programming error

### ** Examples

  x = seq(0, 20*pi, len=1000)
  plot(x*sin(x), x*cos(x), type="l")

  try({   ## on some machines, some of the devices may not be available
    c(
      savepdf("spiral", dir=tempdir()),
      savepng("spiral", dir=tempdir()),
      saveeps("spiral", dir=tempdir()),
      savetiff("spiral", dir=tempdir())
     )
  })    



