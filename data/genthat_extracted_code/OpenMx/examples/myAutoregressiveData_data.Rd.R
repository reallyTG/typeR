library(OpenMx)


### Name: myAutoregressiveData
### Title: Example data with autoregressively related columns
### Aliases: myAutoregressiveData
### Keywords: datasets

### ** Examples

data(myAutoregressiveData)
round(cor(myAutoregressiveData), 2)
# note the sub-diagonal correlations (lag 1)
#  x1-x2, x2-x3, x3-x4, x4-x5
# and the second sub-diagonal correlations (lag 2)
#  x1-x3, x2-x4, x3-x5




