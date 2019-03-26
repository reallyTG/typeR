library(h2o)


### Name: h2o.getAutoML
### Title: Get an R object that is a subclass of H2OAutoML
### Aliases: h2o.getAutoML

### ** Examples

## No test: 
library(h2o)
h2o.init()
votes_path <- system.file("extdata", "housevotes.csv", package = "h2o")
votes_hf <- h2o.uploadFile(path = votes_path, header = TRUE)
aml <- h2o.automl(y = "Class", project_name="aml_housevotes", 
                  training_frame = votes_hf, max_runtime_secs = 30)
automl_retrieved <- h2o.getAutoML("aml_housevotes")
## End(No test)



