library(rgl)


### Name: pch3d
### Title: Plot symbols similar to base graphics.
### Aliases: pch3d

### ** Examples

open3d()
i <- 0:25; x <- i %% 5; y <- rep(0, 26); z <- i %/% 5
pch3d(x, y, z, pch = i, bg = "green")
text3d(x, y, z + 0.3, i)
pch3d(x + 5, y, z, pch = i+65)
text3d(x + 5, y, z + 0.3, i+65)



