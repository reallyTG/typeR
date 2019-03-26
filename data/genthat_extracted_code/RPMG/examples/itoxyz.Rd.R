library(RPMG)


### Name: xyztoi
### Title: Matrix Index to Vector index
### Aliases: xyztoi
### Keywords: misc

### ** Examples


k = itoxyz(24, 6, 6, 1)
xyztoi(k$ix, k$iy, k$iz, 6, 6, 1)

nx = 20
ny = 20
nz = 40

k = itoxyz(2440, nx, ny, nz)
xyztoi(k$ix, k$iy, k$iz, nx, ny, nz )






