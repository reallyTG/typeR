library(netSEM)


### Name: path
### Title: Extract Path Model Equation
### Aliases: path

### ** Examples

##' ## Load the sample acrylic data set
data(acrylic)

## Run netSEM principle three
ans <- netSEMm(acrylic)

## Extract relations between IrradTot and IAD2
cf <- path(ans,from ="IAD2",to="IrradTot")
print(cf)




