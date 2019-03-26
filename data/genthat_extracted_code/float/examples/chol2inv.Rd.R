library(float)


### Name: chol2inv
### Title: chol2inv
### Aliases: chol2inv chol2inv,float32-method

### ** Examples

library(float)

s = flrunif(10, 3)
cp = crossprod(s)
cp %*% chol2inv(chol(cp))




