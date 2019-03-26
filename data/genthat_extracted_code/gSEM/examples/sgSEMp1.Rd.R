library(gSEM)


### Name: sgSEMp1
### Title: Semi-supervised Generalized Structural Equation Modelling (gSEM)
###   - Principle 1
### Aliases: sgSEMp1

### ** Examples

## Load the built-in sample acrylic data set
data(acrylic)

## Run semi-gSEM principle one
ans <- sgSEMp1(acrylic, predictor = "IrradTot", response = "YI")

## Plot the result
plot(ans) #Default cutoff value for a solid path in the resulting graph is 0.2.

## Plot result with different R-sqr cutoff
plot(ans, cutoff = 0.4)

## Summary
summary(ans)

## Extract relations between IrradTot and YI
cf <- path(ans, from = "IrradTot", to = "YI")
print(cf)

## Print three components of the result
ans$table
ans$bestModels
ans$allModels

## Checking fitting result of YI by IrradTot using the exponential model 
summary(ans$allModel[[1,2,4]])     



