library(fpmoutliers)


### Name: build
### Title: Automatic build of the anomaly detection model
### Aliases: build

### ** Examples

# simple build with default parameters (FPI method)
library("fpmoutliers")
data("iris")
model <- fpmoutliers::build(iris[sample(nrow(iris), 5),])

## No test: 
# using other anomaly detection methods for the automatic build (e.g. LFPOF)
library("fpmoutliers")
data("iris")
model <- fpmoutliers::build(iris[sample(nrow(iris), 5),], func=LFPOF)
## End(No test)



