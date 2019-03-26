library(h2o)


### Name: h2o.kmeans
### Title: Performs k-means clustering on an H2O dataset
### Aliases: h2o.kmeans

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.uploadFile(path = prostate_path)
h2o.kmeans(training_frame = prostate, k = 10, x = c("AGE", "RACE", "VOL", "GLEASON"))
## End(No test)



