library(h2o)


### Name: h2o.prcomp
### Title: Principal component analysis of an H2O data frame
### Aliases: h2o.prcomp

### ** Examples

## No test: 
library(h2o)
h2o.init()
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.uploadFile(path = australia_path)
h2o.prcomp(training_frame = australia, k = 8, transform = "STANDARDIZE")
## End(No test)



