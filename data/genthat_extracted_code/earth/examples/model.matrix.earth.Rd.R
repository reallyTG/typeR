library(earth)


### Name: model.matrix.earth
### Title: Get the earth basis matrix
### Aliases: model.matrix.earth
### Keywords: models

### ** Examples

data(trees)
earth.mod <- earth(Volume ~ ., data = trees)
summary(earth.mod, decomp = "none") # "none" to print terms in same order as lm.mod below

bx <- model.matrix(earth.mod)         # equivalent to bx <- earth.mod$bx
lm.mod <- lm(trees$Volume ~ bx[,-1])  # -1 to drop intercept
summary(lm.mod)                       # yields same coeffs as above summary
                                      # displayed t values are not meaningful



