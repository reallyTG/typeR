library(sparsebn)


### Name: cytometryContinuous
### Title: The continuous cytometry network
### Aliases: cytometryContinuous
### Keywords: datasets

### ** Examples

# Create a valid sparsebnData object from the cytometry data
data(cytometryContinuous)
dat <- sparsebnData(cytometryContinuous$data, type = "c", ivn = cytometryContinuous$ivn)




