library(pls)


### Name: mvrCv
### Title: Cross-validation
### Aliases: mvrCv
### Keywords: regression multivariate

### ** Examples

data(yarn)
yarn.pcr <- pcr(density ~ NIR, 6, data = yarn, validation = "CV", segments = 10)
## Not run: plot(MSEP(yarn.pcr))



