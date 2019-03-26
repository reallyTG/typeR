library(RStoolbox)


### Name: predict.superClass
### Title: Predict a raster map based on a superClass model fit.
### Aliases: predict.superClass

### ** Examples

## Load training data
data(rlogo)
train <- readRDS(system.file("external/trainingPoints.rds", package="RStoolbox"))

## Fit classifier 
SC       <- superClass(rlogo, trainData = train, responseCol = "class", 
              model = "rf", tuneLength = 1, predict = FALSE)

map <- predict(SC, rlogo)



