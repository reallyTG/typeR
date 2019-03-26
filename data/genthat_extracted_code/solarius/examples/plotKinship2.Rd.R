library(solarius)


### Name: plotKinship2
### Title: Plot the double kinship matrix
### Aliases: histKinship2 imageKinship2 plotKinship2

### ** Examples

# load `kin` kinship matrix from `dat50` data set
data(dat50)
kin2 <- 2* kin # double kinship matrix

plotKinship2(kin2) # equivalent to `imageKinship2(kin2)`

plotKinship2(kin2, "hist") # equivalent to `histKinship2(kin2)`



