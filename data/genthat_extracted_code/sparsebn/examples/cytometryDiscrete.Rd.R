library(sparsebn)


### Name: cytometryDiscrete
### Title: The discrete cytometry network
### Aliases: cytometryDiscrete
### Keywords: datasets

### ** Examples

# Create a valid sparsebnData object from the cytometry data
data(cytometryDiscrete)
dat <- sparsebnData(cytometryDiscrete$data, type = "d", ivn = cytometryDiscrete$ivn)




