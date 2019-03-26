library(secr)


### Name: make.tri
### Title: Build Detector Array on Triangular or Hexagonal Grid
### Aliases: make.tri clip.hex
### Keywords: datagen

### ** Examples


tri.grid <- make.tri(spacing = 10)
plot(tri.grid, border = 5)

hex <- clip.hex(tri.grid, side = 30, ID = "alpha")
plot (hex, add = TRUE, detpar = list(pch = 16, cex = 1.4),
    label = TRUE, offset = 2.5 )




