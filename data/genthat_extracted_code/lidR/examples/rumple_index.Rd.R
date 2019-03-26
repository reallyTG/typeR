library(lidR)


### Name: rumple_index
### Title: Rumple index of roughness
### Aliases: rumple_index

### ** Examples

x = runif(20, 0, 100)
y = runif(20, 0, 100)

# Perfectly flat surface, rumple_index = 1
z = rep(10, 20)
rumple_index(x, y, z)

# Rough surface, rumple_index > 1
z = runif(20, 0, 10)
rumple_index(x, y, z)

# Rougher surface, rumple_index increases
z = runif(20, 0, 50)
rumple_index(x, y, z)

# Measure of roughness is scale-dependent
rumple_index(x, y, z)
rumple_index(x/10, y/10, z)

# Use with a canopy height model
LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)
chm = grid_canopy(las, 2, p2r())
rumple_index(chm)



