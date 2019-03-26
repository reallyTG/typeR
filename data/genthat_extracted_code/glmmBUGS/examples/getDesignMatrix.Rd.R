library(glmmBUGS)


### Name: getDesignMatrix
### Title: Computes a design matrix from factors and interactions
### Aliases: getDesignMatrix

### ** Examples

library(nlme)
data(Muscle)
muscleDesign = getDesignMatrix(conc ~ length, data=Muscle, effects="Strip" )
attributes(muscleDesign)$covariates
attributes(muscleDesign)$response



