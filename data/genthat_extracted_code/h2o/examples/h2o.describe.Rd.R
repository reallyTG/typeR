library(h2o)


### Name: h2o.describe
### Title: H2O Description of A Dataset
### Aliases: h2o.describe

### ** Examples

## No test: 
library(h2o)
h2o.init()
prostate_path <- system.file("extdata", "prostate.csv", package = "h2o")
prostate <- h2o.importFile(path = prostate_path)
h2o.describe(prostate)
## End(No test)



