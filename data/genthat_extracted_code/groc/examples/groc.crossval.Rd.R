library(groc)


### Name: grocCrossval
### Title: Cross-validation of groc models
### Aliases: grocCrossval
### Keywords: regression multivariate

### ** Examples

data(yarn,package="pls")
yarn.groc <- groc(density ~ NIR, 6, data = yarn)
yarn.cv <- grocCrossval(yarn.groc, segments = 10)

yarn.cv$validation$PRESS
yarn.cv$validation$PREMAD



