library(lidR)


### Name: tree_detection
### Title: Individual tree detection
### Aliases: tree_detection

### ** Examples

LASfile <- system.file("extdata", "MixedConifer.laz", package="lidR")
las <- readLAS(LASfile, select = "xyz", filter = "-drop_z_below 0")

ttops <- tree_detection(las, lmf(ws = 5))

x = plot(las)
add_treetops3d(x, ttops)



