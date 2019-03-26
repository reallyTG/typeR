library(LeArEst)


### Name: areaest
### Title: Performs area estimation of the numerically described object in
###   plane.
### Aliases: areaest

### ** Examples

# load a data set representing the ellipse with additive Gaussian error,
# run area estimation on it, and plot the results
inputfile <- system.file("extdata", "ellipse_3_4_0.1_gauss.txt", package = "LeArEst")
inputdata <- read.table(inputfile)
area <- areaest(inputdata, error = "gauss", var.est = "ML", plot = TRUE,
                slicing = "hv", representation = "ellipse")

# load a data set representing the ellipse with additive Laplacian error,
# run area estimation on it, and plot the results
inputfile <- system.file("extdata", "ellipse_3_4_0.1_laplace.txt", package = "LeArEst")
inputdata <- read.table(inputfile)
area <- areaest(inputdata, error = "laplace", var = 0.1, nrSlices = 5, plot = TRUE,
                slicing = "star", representation = "ellipse")




