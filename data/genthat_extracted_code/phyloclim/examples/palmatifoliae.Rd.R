library(phyloclim)


### Name: palmatifoliae
### Title: _Oxalis_ section _Palmatifoliae_
### Aliases: palmatifoliae PNO sites tree
### Keywords: datasets

### ** Examples

# 290 collections of Palmatifoliae
# --------------------------------
data(sites)
plot(sites$long, sites$lat,
  xlab = "Longitude", ylab = "Latitude")

## PNO profiles along 19 bioclimatic variables
## -------------------------------------------
data(PNO); names(PNO)
temp <- names(PNO)[1]
plotPNO(PNO[[temp]], xlab = temp)

## phylogenetic hypothesis for Palmatifoliae
## -----------------------------------------
data(tree)
plot(tree)



