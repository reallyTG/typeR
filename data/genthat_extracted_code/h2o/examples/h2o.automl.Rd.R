library(h2o)


### Name: h2o.automl
### Title: Automatic Machine Learning
### Aliases: h2o.automl

### ** Examples

## No test: 
library(h2o)
h2o.init()
votes_path <- system.file("extdata", "housevotes.csv", package = "h2o")
votes_hf <- h2o.uploadFile(path = votes_path, header = TRUE)
aml <- h2o.automl(y = "Class", training_frame = votes_hf, max_runtime_secs = 30)
## End(No test)



