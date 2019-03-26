library(RStoolbox)


### Name: predict.unsuperClass
### Title: Predict a raster map based on a unsuperClass model fit.
### Aliases: predict.unsuperClass

### ** Examples

## Load training data
data(rlogo)

## Perform unsupervised classification
uc  <- unsuperClass(rlogo, nClasses = 10)

## Apply the model to another raster
map <- predict(uc, rlogo)



