library(fpmoutliers)


### Name: visualizeInstance
### Title: Visualization of a data instance using a set of barplots
### Aliases: visualizeInstance

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- FPI(dataFrame, minSupport = 0.001)
# sort data by the anomaly score
dataFrame <- dataFrame[order(model$scores, decreasing = TRUE),]
visualizeInstance(dataFrame, 1) # instance with the highest anomaly score
visualizeInstance(dataFrame, nrow(dataFrame)) # instance with the lowest anomaly score



