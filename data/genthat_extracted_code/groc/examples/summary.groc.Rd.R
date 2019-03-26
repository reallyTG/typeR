library(groc)


### Name: summary.groc
### Title: Summary and Print Methods for groc objects
### Aliases: summary.groc print.groc
### Keywords: regression multivariate

### ** Examples

data("yarn",package="pls")
yarn.groc <- groc(density ~ NIR, 6, data = yarn)
yarn.cv <- grocCrossval(yarn.groc, segments = 10)
print(yarn.groc)
summary(yarn.cv)



