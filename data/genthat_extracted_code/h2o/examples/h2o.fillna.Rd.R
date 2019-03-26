library(h2o)


### Name: h2o.fillna
### Title: fillNA
### Aliases: h2o.fillna

### ** Examples

## No test: 
library(h2o)
h2o.init()
fr_with_nas = h2o.createFrame(categorical_fraction = 0.0, missing_fraction = 0.7, rows = 6,
                              cols = 2, seed = 123)
fr <- h2o.fillna(fr_with_nas, "forward", axis = 1, maxlen = 2L)
## End(No test)



