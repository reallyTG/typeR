library(PredPsych)


### Name: DimensionRed
### Title: Generic Dimensionallity Reduction Function
### Aliases: DimensionRed

### ** Examples

# reducing dimension of Grip aperture from 10 to 2
GripAperture <- DimensionRed(KinData,selectedCols = 12:21,
outcome = KinData[,"Object.Size"],plot = TRUE)




