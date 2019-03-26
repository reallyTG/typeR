library(pls)


### Name: scores
### Title: Extract Scores and Loadings from PLSR and PCR Models
### Aliases: scores scores.default loadings loadings.default
###   loading.weights Yscores Yloadings
### Keywords: regression multivariate

### ** Examples

data(yarn)
plsmod <- plsr(density ~ NIR, 6, data = yarn)
scores(plsmod)
loadings(plsmod)[,1:4]



