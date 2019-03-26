library(grec)


### Name: detectFronts.RasterLayer
### Title: Apply gradient-based methodologies to environmental data
### Aliases: detectFronts.RasterLayer detectFronts.array
###   detectFronts.default detectFronts detectFronts.list
###   detectFronts.matrix

### ** Examples

# Build an example data
# Load example data
data(sst)
exampleSSTData <- list(x = sst$longitude,
                       y = sst$latitude,
                       z = sst$sst[,,1])
# Simple application (over a XYZ list)
out <- detectFronts(x = exampleSSTData)
image(out, col = colPalette)



