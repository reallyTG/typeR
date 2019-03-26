library(softmaxreg)


### Name: convertClass2Matrix
### Title: Convert A Vector of Factors to Matrix
### Aliases: convertClass2Matrix
### Keywords: ~kwd1 ~kwd2

### ** Examples

## This Function can be used to convert factor to matrix yMat.
## e.g. For type 'raw' softmaxReg function input yMat, softmax regression.
y = as.factor(c(rep(1,50),rep(2,50),rep(3,50)))
yMat = convertClass2Matrix(y)
nObs = dim(yMat)[1]
K = dim(yMat)[2]
nObs
K



