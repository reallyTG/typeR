library(h2o)


### Name: h2o.r2
### Title: Retrieve the R2 value
### Aliases: h2o.r2

### ** Examples

## No test: 
library(h2o)

h <- h2o.init()
fr <- as.h2o(iris)

m <- h2o.glm(x = 2:5, y = 1, training_frame = fr)

h2o.r2(m)
## End(No test)



