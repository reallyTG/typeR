library(gSEM)


### Name: path
### Title: Extract Path Coefficients
### Aliases: path

### ** Examples

##' ## Load the sample acrylic data set
data(acrylic)

## Run semi-gSEM principle one
ans <- sgSEMp1(acrylic, predictor = "IrradTot", response = "YI")

## Extract relations between IrradTot and IAD2
cf <- path(ans, from = "IrradTot", to = "IAD2")
print(cf)



