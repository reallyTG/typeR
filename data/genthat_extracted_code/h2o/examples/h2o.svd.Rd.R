library(h2o)


### Name: h2o.svd
### Title: Singular value decomposition of an H2O data frame using the
###   power method
### Aliases: h2o.svd

### ** Examples

## No test: 
library(h2o)
h2o.init()
australia_path <- system.file("extdata", "australia.csv", package = "h2o")
australia <- h2o.uploadFile(path = australia_path)
h2o.svd(training_frame = australia, nv = 8)
## End(No test)



