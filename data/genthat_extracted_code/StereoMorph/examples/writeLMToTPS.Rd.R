library(StereoMorph)


### Name: writeLMToTPS
### Title: Writes landmarks as TPS file
### Aliases: writeLMToTPS

### ** Examples

# Get the path to package example files
fdir <- paste0(path.package("StereoMorph"), "/extdata/")

# Write 2D landmark pixel coordinates from a single shape file to TPS
writeLMToTPS(paste0(fdir, 'Shapes_2D/mug_003.txt'), 'Mug_2D.tps')

# Write 3D landmark coordinates from a single shape file to TPS
writeLMToTPS(paste0(fdir, 'Shapes_3D/bubo_virginianus_FMNH488595.txt'), 'Owl_3D.tps')

# Write 2D landmark pixel coordinates from multiple shape file to TPS
writeLMToTPS(paste0(fdir, 'Shapes_2D'), 'Shapes_2D.tps')

# Write 3D landmark coordinates from multiple shape file to TPS
writeLMToTPS(paste0(fdir, 'Shapes_3D'), 'Shapes_3D.tps', in.pixels=FALSE)



