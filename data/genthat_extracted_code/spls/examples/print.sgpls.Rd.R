library(spls)


### Name: print.sgpls
### Title: Print function for a SGPLS object
### Aliases: print.sgpls
### Keywords: models multivariate methods

### ** Examples

data(prostate)
# SGPLS with eta=0.55 & 3 hidden components
f <- sgpls( prostate$x, prostate$y, K=3, eta=0.55, scale.x=FALSE )
print(f)



