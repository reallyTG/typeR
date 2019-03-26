library(spc4sts)


### Name: showNb
### Title: Show Neighborhood
### Aliases: showNb

### ** Examples

## show the neighorhood with variables names of the data frame constructed by dataPrep()
img <- matrix(1:25, 5, 5) # an image of size 5x5 pixels
img
dataPrep(img, 2)
showNb(c(2, 2, 2)) # showNb(2) has the same effect

## show the neighorhood with predictors and their importance used in the model returned
## by surfacemodel()
img <- sarGen(m = 100, n = 100, border = 50) # training image
model <- surfacemodel(img, nb = 3)
showNb(model, "predictors") # show predictors
showNb(model, "importance") # show predictor percentage importance



