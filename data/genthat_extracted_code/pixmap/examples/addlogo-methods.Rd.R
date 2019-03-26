library(pixmap)


### Name: addlogo-methods
### Title: Methods for Adding a Pixmap Logo to a Plot
### Aliases: addlogo addlogo-methods addlogo,pixmap-method
### Keywords: methods

### ** Examples

x <- read.pnm(system.file("pictures/logo.ppm", package="pixmap")[1])
plot(x)
for (i in 1:7)
  addlogo(x, px=c(0, (101/77)*11), py=c((i-1)*11, i*11), asp=1)



