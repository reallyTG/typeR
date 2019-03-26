library(h2o)


### Name: h2o.insertMissingValues
### Title: Insert Missing Values into an H2OFrame
### Aliases: h2o.insertMissingValues

### ** Examples

## No test: 
library(h2o)
h2o.init()

iris_hf <- as.h2o(iris)
summary(iris_hf)

irismiss <- h2o.insertMissingValues(iris_hf, fraction = 0.25)
head(irismiss)
summary(irismiss)
## End(No test)



