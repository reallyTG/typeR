library(pixmap)


### Name: pnm
### Title: Read/Write Portable Anymap Images
### Aliases: write.pnm read.pnm read.pnmdata read.pnmhead
### Keywords: file color

### ** Examples

 x <- read.pnm(system.file("pictures/logo.ppm", package="pixmap")[1])
 plot(x)
 print(x)

 x <- read.pnm(system.file("pictures/logo.pgm", package="pixmap")[1])
 plot(x)

 x <- read.pnm(system.file("pictures/logo.pbm", package="pixmap")[1])
 plot(x)



