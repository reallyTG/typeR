library(spls)


### Name: print.splsda
### Title: Print function for a SPLSDA object
### Aliases: print.splsda
### Keywords: models multivariate methods

### ** Examples

data(prostate)
# SPLSDA with eta=0.8 & 3 hidden components
f <- splsda( prostate$x, prostate$y, K=3, eta=0.8, scale.x=FALSE )
print(f)



