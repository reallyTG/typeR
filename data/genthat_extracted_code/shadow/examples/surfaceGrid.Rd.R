library(shadow)


### Name: surfaceGrid
### Title: Create grid of 3D points covering the 'facades' and 'roofs' of
###   obstacles
### Aliases: surfaceGrid

### ** Examples

grid = surfaceGrid(
  obstacles = build,
  obstacles_height_field = "BLDG_HT",
  res = 2
)
plot(grid)
plot(grid, pch = 1, lwd = 0.1, col = "black", add = TRUE)

# When 'res' is smaller then height, facade will be left unsampled
build_small = build
build_small$BLDG_HT = 1
grid = surfaceGrid(
  obstacles = build_small,
  obstacles_height_field = "BLDG_HT",
  res = 2
)
table(grid$type)

grid = surfaceGrid(
  obstacles = build_small,
  obstacles_height_field = "BLDG_HT",
  res = 2.00001  # res/2 > h
)
table(grid$type)




