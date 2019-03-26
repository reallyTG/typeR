library(h2o)


### Name: h2o.glrm
### Title: Generalized low rank decomposition of an H2O data frame
### Aliases: h2o.glrm

### ** Examples

## No test: 
library(h2o)
h2o.init()
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.uploadFile(path = australia_path)
h2o.glrm(training_frame = australia, k = 5, loss = "Quadratic", regularization_x = "L1",
gamma_x = 0.5, gamma_y = 0, max_iterations = 1000)
## End(No test)



