library(h2o)


### Name: h2o.createFrame
### Title: Data H2OFrame Creation in H2O
### Aliases: h2o.createFrame

### ** Examples

## No test: 
library(h2o)
h2o.init()
hf <- h2o.createFrame(rows = 1000, cols = 100, categorical_fraction = 0.1,
                      factors = 5, integer_fraction = 0.5, integer_range = 1,
                      has_response = TRUE)
head(hf)
summary(hf)

hf <- h2o.createFrame(rows = 100, cols = 10, randomize = FALSE, value = 5,
                      categorical_fraction = 0, integer_fraction = 0)
summary(hf)
## End(No test)



