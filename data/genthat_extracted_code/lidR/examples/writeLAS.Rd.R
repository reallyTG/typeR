library(lidR)


### Name: writeLAS
### Title: Write a .las or .laz file
### Aliases: writeLAS

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)
subset = lasclipRectangle(las, 684850, 5017850, 684900, 5017900)
writeLAS(subset, tempfile(fileext = ".laz"))



