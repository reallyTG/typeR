library(RStoolbox)


### Name: superClass
### Title: Supervised Classification
### Aliases: superClass

### ** Examples

library(caret)
library(randomForest)
library(e1071)
library(raster)
data(rlogo)
train <- readRDS(system.file("external/trainingPoints.rds", package="RStoolbox"))

## Plot training data
olpar <- par(no.readonly = TRUE) # back-up par
par(mfrow=c(1,2))
colors <- c("yellow", "green", "deeppink")
plotRGB(rlogo)
plot(train, add = TRUE, col =  colors[train$class], pch = 19)

## Fit classifier (splitting training into 70% training data, 30% validation data)
SC       <- superClass(rlogo, trainData = train, responseCol = "class", 
model = "rf", tuneLength = 1, trainPartition = 0.7)
SC

## Plots
plot(SC$map, col = colors, legend = FALSE, axes = FALSE, box = FALSE)
legend(1,1, legend = levels(train$class), fill = colors , title = "Classes", 
horiz = TRUE,  bty = "n")
par(olpar) # reset par



