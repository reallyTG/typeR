library(ffmanova)


### Name: fixModelMatrix
### Title: Fix the "factor" matrix of a terms object.
### Aliases: fixModelMatrix
### Keywords: models

### ** Examples


mt <- terms(y ~ a + b + a:b + a:c + I(a^2) + I(a^3) + I(a^2):b)
print(mOld <- attr(mt, "factor"))
fixModelMatrix(mOld)




