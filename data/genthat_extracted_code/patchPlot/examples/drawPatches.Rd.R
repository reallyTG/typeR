library(patchPlot)


### Name: drawPatches
### Title: drawPatches
### Aliases: drawPatches

### ** Examples

data <- matrix(runif(20), ncol=2)
coldata <- matrix(runif(30), ncol=3)
hatchdata <- matrix(runif(30), ncol=3)
patches <- genHatchData(coldata, hatchdata)
drawPatches(data, patches)



