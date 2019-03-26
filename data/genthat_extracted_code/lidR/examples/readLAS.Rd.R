library(lidR)


### Name: readLAS
### Title: Read .las or .laz files
### Aliases: readLAS

### ** Examples

LASfile <- system.file("extdata", "Megaplot.laz", package="lidR")
las = readLAS(LASfile)
las = readLAS(LASfile, select = "xyz")
las = readLAS(LASfile, select = "xyzi", filter = "-keep_first")
las = readLAS(LASfile, select = "xyziar", filter = "-keep_first -drop_z_below 0")

# Negation of attribute is also possible (all except intensity and angle)
las = readLAS(LASfile, select = "* -i -a")



