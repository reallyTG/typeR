library(fpmoutliers)


### Name: describeInstance
### Title: Explain the instance/outlier by a brief textual summary
### Aliases: describeInstance

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- FPI(dataFrame, minSupport = 0.001)
# sort data by the anomaly score
dataFrame <- dataFrame[order(model$scores, decreasing = TRUE),]
# instance with the highest anomaly score
describeInstance(dataFrame, model, 1)
# instance with the lowest anomaly score
describeInstance(dataFrame, model, nrow(dataFrame))



